# -*- coding=utf-8 -*-
"""
lua2csv - Lua配置表还原为CSV表格
反向转换工具，将Lua配置文件还原为原始CSV格式

使用方法:
    python lua2csv.py <lua_src_path> <csv_output_path>

示例:
    python lua2csv.py C:/ceshiduan/src/config G:/pokemon_server/csv表格/restored_config
"""

import os
import re
import sys
import codecs
import traceback

# ===== 全局配置 =====
LUA_SRC_PATH = ''  # Lua配置文件目录
CSV_OUTPUT_PATH = ''  # CSV输出目录


# ===== Lua解析器 =====
class LuaParser(object):
    """Lua文件解析器"""
    
    def __init__(self):
        self.predefine = {}  # __predefine_t__ 预定义表
        self.data = {}  # 主数据表
        self.defaults = {}  # 默认值
        self.table_name = ''  # 表名 csv.xxx
    
    def parse_file(self, filepath):
        """解析Lua文件"""
        with codecs.open(filepath, 'r', 'utf-8') as f:
            content = f.read()
        
        # 提取表名
        self.table_name = self._extract_table_name(content)
        if not self.table_name:
            print u'警告: 无法提取表名 %s' % filepath
            return False
        
        # 解析 __predefine_t__
        self.predefine = self._parse_predefine(content)
        
        # 解析主数据表
        self.data, self.defaults = self._parse_main_table(content)
        
        return True
    
    def _extract_table_name(self, content):
        """提取表名 csv.xxx"""
        # 匹配 csv.xxx = { 或 csv['xxx'] = {
        match = re.search(r"(csv(?:\['?\w+'?\]|\.\w+)+)\s*=\s*\{", content)
        if match:
            return match.group(1)
        return None
    
    def _parse_predefine(self, content):
        """解析 __predefine_t__ 预定义表"""
        predefine = {}
        
        # 找到 __predefine_t__ 的开始位置
        match = re.search(r'local\s+__predefine_t__\s*=\s*\{', content)
        if not match:
            return predefine
        
        start = match.end()
        # 找到匹配的结束大括号
        brace_count = 1
        pos = start
        while pos < len(content) and brace_count > 0:
            if content[pos] == '{':
                brace_count += 1
            elif content[pos] == '}':
                brace_count -= 1
            pos += 1
        
        predefine_content = content[start:pos-1]
        
        # 解析每个预定义项 [N] = {...}
        pattern = r'\[(\d+)\]\s*=\s*'
        for match in re.finditer(pattern, predefine_content):
            idx = int(match.group(1))
            value_start = match.end()
            value = self._extract_value(predefine_content, value_start)
            if value is not None:
                predefine[idx] = value
        
        return predefine
    
    def _parse_main_table(self, content):
        """解析主数据表"""
        data = {}
        defaults = {}
        
        # 找到主表定义
        table_pattern = re.escape(self.table_name) + r'\s*=\s*\{'
        match = re.search(table_pattern, content)
        if not match:
            return data, defaults
        
        # 解析主表中的数据
        start = match.end()
        brace_count = 1
        pos = start
        while pos < len(content) and brace_count > 0:
            if content[pos] == '{':
                brace_count += 1
            elif content[pos] == '}':
                brace_count -= 1
            pos += 1
        
        main_content = content[start:pos-1]
        
        # 解析 __default
        default_match = re.search(r'__default\s*=\s*\{\s*__index\s*=\s*\{', main_content)
        if default_match:
            default_start = default_match.end()
            defaults = self._parse_fields(main_content, default_start)
        
        # 解析数据行 [ID] = {...}
        row_pattern = r'\[(\d+)\]\s*=\s*\{'
        for match in re.finditer(row_pattern, main_content):
            row_id = int(match.group(1))
            row_start = match.end()
            row_data = self._parse_fields(main_content, row_start - 1)
            if row_data:
                data[row_id] = row_data
        
        # 解析 (function() ... end)() 块中的数据
        func_blocks = re.finditer(r';\(function\(\)\s*local\s+t\s*=\s*' + re.escape(self.table_name), content)
        for func_match in func_blocks:
            block_start = func_match.end()
            # 找到 end)()
            block_end = content.find('end)()', block_start)
            if block_end == -1:
                continue
            block_content = content[block_start:block_end]
            
            # 解析 t[ID] = {...}
            t_pattern = r't\[(\d+)\]\s*=\s*\{'
            for t_match in re.finditer(t_pattern, block_content):
                row_id = int(t_match.group(1))
                row_start = t_match.end()
                row_data = self._parse_fields(block_content, row_start - 1)
                if row_data:
                    data[row_id] = row_data
        
        return data, defaults
    
    def _parse_fields(self, content, start):
        """解析字段 {field = value, ...}"""
        fields = {}
        
        # 找到开始的 {
        pos = start
        while pos < len(content) and content[pos] != '{':
            pos += 1
        if pos >= len(content):
            return fields
        
        pos += 1  # 跳过 {
        brace_count = 1
        field_content = ''
        
        while pos < len(content) and brace_count > 0:
            ch = content[pos]
            if ch == '{':
                brace_count += 1
                field_content += ch
            elif ch == '}':
                brace_count -= 1
                if brace_count > 0:
                    field_content += ch
            else:
                field_content += ch
            pos += 1
        
        # 解析字段
        fields = self._parse_field_content(field_content)
        return fields
    
    def _parse_field_content(self, content):
        """解析字段内容"""
        fields = {}
        content = content.strip()
        if not content:
            return fields
        
        # 分割字段，注意处理嵌套结构
        pos = 0
        while pos < len(content):
            # 跳过空白和逗号
            while pos < len(content) and content[pos] in ' \t\r\n,':
                pos += 1
            if pos >= len(content):
                break
            
            # 跳过注释
            if content[pos:pos+2] == '--':
                # 找到行尾
                end = content.find('\n', pos)
                if end == -1:
                    break
                pos = end + 1
                continue
            
            # 解析字段名
            field_match = re.match(r'(\w+)\s*=\s*', content[pos:])
            if not field_match:
                # 可能是数组元素 [N] = value
                idx_match = re.match(r'\[(\d+)\]\s*=\s*', content[pos:])
                if idx_match:
                    field_name = int(idx_match.group(1))
                    pos += idx_match.end()
                else:
                    # 跳过无法解析的内容
                    next_comma = content.find(',', pos)
                    if next_comma == -1:
                        break
                    pos = next_comma + 1
                    continue
            else:
                field_name = field_match.group(1)
                pos += field_match.end()
            
            # 解析字段值
            value, end_pos = self._parse_value_at(content, pos)
            if value is not None:
                fields[field_name] = value
            pos = end_pos
        
        return fields
    
    def _parse_value_at(self, content, pos):
        """解析指定位置的值"""
        # 跳过空白
        while pos < len(content) and content[pos] in ' \t\r\n':
            pos += 1
        
        if pos >= len(content):
            return None, pos
        
        ch = content[pos]
        
        # 字符串
        if ch in '"\'':
            return self._parse_string(content, pos)
        
        # 表/数组
        if ch == '{':
            return self._parse_table(content, pos)
        
        # __predefine_t__ 引用
        if content[pos:pos+15] == '__predefine_t__':
            return self._parse_predefine_ref(content, pos)
        
        # 数字或标识符
        return self._parse_simple_value(content, pos)
    
    def _parse_string(self, content, pos):
        """解析字符串"""
        quote = content[pos]
        pos += 1
        result = ''
        while pos < len(content):
            ch = content[pos]
            if ch == '\\' and pos + 1 < len(content):
                result += content[pos + 1]
                pos += 2
                continue
            if ch == quote:
                pos += 1
                break
            result += ch
            pos += 1
        return result, pos
    
    def _parse_table(self, content, pos):
        """解析表/数组"""
        if content[pos] != '{':
            return None, pos
        
        pos += 1
        brace_count = 1
        table_content = ''
        
        while pos < len(content) and brace_count > 0:
            ch = content[pos]
            if ch == '{':
                brace_count += 1
            elif ch == '}':
                brace_count -= 1
            if brace_count > 0:
                table_content += ch
            pos += 1
        
        # 判断是数组还是字典
        result = self._parse_table_content(table_content)
        return result, pos
    
    def _parse_table_content(self, content):
        """解析表内容，返回列表或字典"""
        content = content.strip()
        if not content:
            return {}
        
        # 检查是否是数组（没有 key = value 格式）
        is_array = True
        has_named_key = False
        
        # 简单检测：如果有 xxx = 格式则是字典
        if re.search(r'^\s*\w+\s*=', content) or re.search(r'^\s*\[\d+\]\s*=', content):
            is_array = False
        
        if is_array:
            return self._parse_array_content(content)
        else:
            return self._parse_dict_content(content)
    
    def _parse_array_content(self, content):
        """解析数组内容"""
        result = []
        pos = 0
        
        while pos < len(content):
            # 跳过空白和逗号
            while pos < len(content) and content[pos] in ' \t\r\n,':
                pos += 1
            if pos >= len(content):
                break
            
            # 解析值
            value, pos = self._parse_value_at(content, pos)
            if value is not None:
                result.append(value)
        
        return result
    
    def _parse_dict_content(self, content):
        """解析字典内容"""
        return self._parse_field_content(content)
    
    def _parse_predefine_ref(self, content, pos):
        """解析 __predefine_t__[N] 引用"""
        match = re.match(r'__predefine_t__\[(\d+)\]', content[pos:])
        if match:
            idx = int(match.group(1))
            pos += match.end()
            # 返回实际值
            if idx in self.predefine:
                return self.predefine[idx], pos
            return {'__ref__': idx}, pos
        return None, pos
    
    def _parse_simple_value(self, content, pos):
        """解析简单值（数字、布尔、标识符）"""
        # 匹配到下一个分隔符
        match = re.match(r'([^,}\r\n]+)', content[pos:])
        if match:
            value = match.group(1).strip()
            pos += match.end()
            
            # 处理注释
            if '--' in value:
                value = value[:value.find('--')].strip()
            
            # 转换类型
            if value in ('true', 'True', 'TRUE'):
                return True, pos
            elif value in ('false', 'False', 'FALSE'):
                return False, pos
            elif value in ('nil', 'Nil', 'NIL'):
                return None, pos
            
            # 尝试数字
            try:
                if '.' in value:
                    return float(value), pos
                else:
                    return int(value), pos
            except:
                return value, pos
        
        return None, pos
    
    def _extract_value(self, content, start):
        """提取值（用于 __predefine_t__）"""
        value, _ = self._parse_value_at(content, start)
        return value


# ===== CSV生成器 =====
class CsvGenerator(object):
    """CSV生成器"""
    
    def __init__(self, parser):
        self.parser = parser
    
    def generate(self, original_csv_path=None):
        """生成CSV内容"""
        # 获取所有字段名
        all_fields = self._collect_all_fields()
        
        # 如果有原始CSV，使用原始列顺序
        if original_csv_path and os.path.exists(original_csv_path):
            field_order = self._get_original_field_order(original_csv_path)
            # 合并新字段
            for f in all_fields:
                if f not in field_order:
                    field_order.append(f)
        else:
            field_order = all_fields
        
        # 确保 id 在第一列（变量名列）
        if 'id' in field_order:
            field_order.remove('id')
        field_order = [u'变量名'] + field_order  # id 会单独处理
        
        lines = []
        
        # 第一行：变量名
        header = [u'变量名'] + [f for f in field_order[1:]]
        lines.append(self._to_csv_line(header))
        
        # 第二行：默认值
        defaults = [u'默认值']
        for f in field_order[1:]:
            if f in self.parser.defaults:
                defaults.append(self._value_to_csv(self.parser.defaults[f]))
            else:
                defaults.append('')
        lines.append(self._to_csv_line(defaults))
        
        # 第三行：说明（空）
        desc = [u'ID'] + [f for f in field_order[1:]]
        lines.append(self._to_csv_line(desc))
        
        # 数据行
        for row_id in sorted(self.parser.data.keys()):
            row_data = self.parser.data[row_id]
            row = [str(row_id)]
            for f in field_order[1:]:
                if f in row_data:
                    row.append(self._value_to_csv(row_data[f]))
                else:
                    row.append('')
            lines.append(self._to_csv_line(row))
        
        return u'\r\n'.join(lines)
    
    def _collect_all_fields(self):
        """收集所有字段名"""
        fields = set()
        
        # 从默认值收集
        for f in self.parser.defaults:
            if f != '__size' and not str(f).startswith('__'):
                fields.add(f)
        
        # 从数据收集
        for row_data in self.parser.data.values():
            for f in row_data:
                if f != 'id' and f != '__size' and not str(f).startswith('__'):
                    fields.add(f)
        
        return sorted(fields, key=lambda x: str(x))
    
    def _get_original_field_order(self, csv_path):
        """从原始CSV获取字段顺序"""
        try:
            with codecs.open(csv_path, 'r', 'utf-8-sig') as f:
                first_line = f.readline()
            fields = [x.strip() for x in first_line.split(',')]
            return fields
        except:
            return []
    
    def _value_to_csv(self, value):
        """将值转换为CSV格式"""
        if value is None:
            return ''
        
        if isinstance(value, bool):
            return 'TRUE' if value else 'FALSE'
        
        if isinstance(value, (int, float)):
            # 整数不带小数点
            if isinstance(value, float) and value == int(value):
                return str(int(value))
            return str(value)
        
        if isinstance(value, basestring):
            # 如果包含特殊字符，需要引号
            if ',' in value or '"' in value or '\n' in value:
                return '"%s"' % value.replace('"', '""')
            return value
        
        if isinstance(value, list):
            return self._array_to_csv(value)
        
        if isinstance(value, dict):
            return self._dict_to_csv(value)
        
        return str(value)
    
    def _array_to_csv(self, arr):
        """将数组转换为CSV格式 <a;b;c>"""
        if not arr:
            return '<>'
        
        items = []
        for item in arr:
            items.append(self._value_to_csv_inner(item))
        
        return '<%s>' % ';'.join(items)
    
    def _dict_to_csv(self, d):
        """将字典转换为CSV格式 {key=value;key=value}"""
        if not d:
            return '{}'
        
        # 过滤 __size 等元数据
        items = []
        for k, v in d.items():
            if str(k).startswith('__'):
                continue
            key_str = str(k) if isinstance(k, int) else "'%s'" % k
            val_str = self._value_to_csv_inner(v)
            items.append('%s=%s' % (key_str, val_str))
        
        if not items:
            return '{}'
        
        return '{%s}' % ';'.join(items)
    
    def _value_to_csv_inner(self, value):
        """内部值转换（用于嵌套结构）"""
        if value is None:
            return ''
        
        if isinstance(value, bool):
            return 'true' if value else 'false'
        
        if isinstance(value, (int, float)):
            if isinstance(value, float) and value == int(value):
                return str(int(value))
            return str(value)
        
        if isinstance(value, basestring):
            # 字符串需要单引号
            if ';' in value or '=' in value or '<' in value or '>' in value or '{' in value or '}' in value:
                return "'%s'" % value.replace("'", "\\'")
            return value
        
        if isinstance(value, list):
            return self._array_to_csv(value)
        
        if isinstance(value, dict):
            return self._dict_to_csv(value)
        
        return str(value)
    
    def _to_csv_line(self, values):
        """将值列表转换为CSV行"""
        result = []
        for v in values:
            if v is None:
                result.append('')
            elif isinstance(v, basestring):
                # 如果包含逗号或引号，需要引号包围
                if ',' in v or '"' in v or '\r' in v or '\n' in v:
                    result.append('"%s"' % v.replace('"', '""'))
                else:
                    result.append(v)
            else:
                result.append(str(v))
        return ','.join(result)


# ===== 主函数 =====
def convert_file(lua_path, csv_path, original_csv_path=None):
    """转换单个文件"""
    parser = LuaParser()
    if not parser.parse_file(lua_path):
        return False
    
    generator = CsvGenerator(parser)
    csv_content = generator.generate(original_csv_path)
    
    # 确保输出目录存在
    output_dir = os.path.dirname(csv_path)
    if output_dir and not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    # 写入CSV文件 (UTF-8 with BOM)
    with codecs.open(csv_path, 'w', 'utf-8-sig') as f:
        f.write(csv_content)
    
    return True


def convert_directory(lua_src_path, csv_output_path, original_csv_path=None):
    """转换整个目录"""
    success_count = 0
    fail_count = 0
    
    for root, dirs, files in os.walk(lua_src_path):
        for filename in files:
            if not filename.endswith('.lua'):
                continue
            if filename == 'csv.lua':
                continue  # 跳过主入口文件
            
            lua_path = os.path.join(root, filename)
            
            # 计算相对路径
            rel_path = os.path.relpath(lua_path, lua_src_path)
            csv_rel_path = rel_path.replace('.lua', '.csv')
            csv_path = os.path.join(csv_output_path, csv_rel_path)
            
            # 原始CSV路径（如果提供）
            orig_csv = None
            if original_csv_path:
                orig_csv = os.path.join(original_csv_path, csv_rel_path)
            
            try:
                print u'转换: %s' % rel_path
                if convert_file(lua_path, csv_path, orig_csv):
                    success_count += 1
                else:
                    print u'  跳过（无法解析）'
                    fail_count += 1
            except Exception as e:
                print u'  失败: %s' % str(e)
                traceback.print_exc()
                fail_count += 1
    
    print u'\n转换完成: 成功 %d, 失败 %d' % (success_count, fail_count)


def main():
    if len(sys.argv) < 3:
        print __doc__
        print u'\n用法: python lua2csv.py <lua_src_path> <csv_output_path> [original_csv_path]'
        print u'\n参数:'
        print u'  lua_src_path     - Lua配置文件目录'
        print u'  csv_output_path  - CSV输出目录'
        print u'  original_csv_path - 原始CSV目录（可选，用于保持列顺序）'
        return
    
    lua_src_path = sys.argv[1]
    csv_output_path = sys.argv[2]
    original_csv_path = sys.argv[3] if len(sys.argv) > 3 else None
    
    print u'Lua源目录: %s' % lua_src_path
    print u'CSV输出目录: %s' % csv_output_path
    if original_csv_path:
        print u'原始CSV目录: %s' % original_csv_path
    print u''
    
    convert_directory(lua_src_path, csv_output_path, original_csv_path)


if __name__ == '__main__':
    main()

