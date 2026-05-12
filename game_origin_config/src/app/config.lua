slot3 = {
	["rightTopPanel.RedFoxMoneyPanel.btnAdd"] = "RedFoxMoneyBtnAdd",
	["rightTopPanel.diamondPanel.num"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "rmb"),
			method = function (slot0)
				return mathEasy.getShortNumber(slot0, 2)
			end
		}
	},
	["rightTopPanel.RedFoxMoneyPanel"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRedFoxMoneyClick")
			}
		}
	}
}

return {
	title = {
		["leftTopPanel.title"] = {
			varname = "titleText",
			binds = {
				event = "effect",
				data = {
					glow = {
						color = cc.c4b(255, 255, 255, 255)
					}
				}
			}
		},
		["leftTopPanel.subTitle"] = {
			varname = "subTitleText",
			binds = {
				event = "effect",
				data = {
					glow = {
						color = cc.c4b(255, 255, 255, 255)
					}
				}
			}
		},
		["leftTopPanel.back"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onClose")
				}
			}
		}
	},
	gold = {
		["rightTopPanel.goldPanel.btnAdd"] = "goldBtnAdd",
		["rightTopPanel.goldPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "gold"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.goldPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onGoldClick")
				}
			}
		}
	},
	diamond = {
		["rightTopPanel.diamondPanel.btnAdd"] = "diamondBtnAdd",
		["rightTopPanel.diamondPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "rmb"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.diamondPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onDiamondClick")
				}
			}
		}
	},
	stamina = {
		["rightTopPanel.staminaPanel.max"] = "staminaMaxText",
		["rightTopPanel.staminaPanel.num"] = "staminaText",
		["rightTopPanel.staminaPanel"] = {
			varname = "staminaPanel",
			binds = {
				event = "touch",
				longtouch = true,
				method = bindHelper.self("onStaminaLongTouch")
			}
		},
		["rightTopPanel.staminaPanel.btnAdd"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onStaminaClick")
				}
			}
		}
	},
	rightTopPanel = {
		rightTopPanel = "rightTopPanel"
	},
	union = {
		["rightTopPanel.unionCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin3"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.unionCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onUnionCoinClick")
				}
			}
		}
	},
	arena = {
		["rightTopPanel.pvpCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin1"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.pvpCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onPvpCoinClick")
				}
			}
		}
	},
	union_combet = {
		["rightTopPanel.pvpCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin10"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.pvpCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onUnionCombetClick")
				}
			}
		}
	},
	explorer = {
		["rightTopPanel.explorerCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin4"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.explorerCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onExplorerCoinClick")
				}
			}
		}
	},
	fragment = {
		["rightTopPanel.fragmentCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin5"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.fragmentCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onFragmentCoinClick")
				}
			}
		}
	},
	randomTower = {
		["rightTopPanel.randomTowerCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin2"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.randomTowerCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onRandomTowerCoinClick")
				}
			}
		}
	},
	skinCard = {
		["rightTopPanel.skinCardPanel.btnAdd"] = "rmbSkinBtnAdd",
		["rightTopPanel.skinCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.skinCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.skinCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onSkinCardClick")
				}
			}
		}
	},
	craft = {
		["rightTopPanel.pvpCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin6"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.pvpCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onCraftCoinClick")
				}
			}
		}
	},
	capture = {
		["rightTopPanel.ballPanel3.num"] = "num3",
		["rightTopPanel.ballPanel2.num"] = "num2",
		["rightTopPanel.ballPanel1.num"] = "num1",
		["rightTopPanel.ballPanel1"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onBallClick")
				}
			}
		},
		["rightTopPanel.ballPanel2"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onBallClick")
				}
			}
		},
		["rightTopPanel.ballPanel3"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onBallClick")
				}
			}
		}
	},
	drawcard = {
		["rightTopPanel.equipCoinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "equip_awake_frag"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.equipCoinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onDrawcardCoinClick")
				}
			}
		}
	},
	rmbCard = {
		["rightTopPanel.rmbCardPanel.btnAdd"] = "rmbCardBtnAdd",
		["rightTopPanel.rmbCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.rmbCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.rmbCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onRmbCardClick")
				}
			}
		}
	},
	limitCard = {
		["rightTopPanel.limitCardPanel.btnAdd"] = "limitCardBtnAdd",
		["rightTopPanel.limitCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.limitCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.limitCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onLimitCardClick")
				}
			}
		}
	},
	crossMine = {
		["rightTopPanel.coin8Panel.btnAdd"] = "btnAdd",
		["rightTopPanel.coin8Panel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin13"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.coin8Panel"] = {
			varname = "coin8Panel",
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onCrossMineCoinClick")
				}
			}
		}
	},
	goldCard = {
		["rightTopPanel.goldCardPanel.btnAdd"] = "goldCardBtnAdd",
		["rightTopPanel.goldCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.goldCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.goldCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onGoldCardClick")
				}
			}
		}
	},
	equipCard = {
		["rightTopPanel.equipCardPanel.btnAdd"] = "equipCardBtnAdd",
		["rightTopPanel.equipCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.equipCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.equipCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onEquipCardClick")
				}
			}
		}
	},
	diamondUpCard = {
		["rightTopPanel.diamondUpCardPanel.btnAdd"] = "diamondUpCardBtnAdd",
		["rightTopPanel.diamondUpCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.diamondUpCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.diamondUpCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onDiamondUpCardClick")
				}
			}
		}
	},
	luckyEgg = {
		["rightTopPanel.luckyEggCardPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.luckyEggCard] or 0, 2)
				end
			}
		},
		["rightTopPanel.luckyEggCardPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onluckyEggCardClick")
				}
			}
		}
	},
	crossCraft = {
		["rightTopPanel.coin8Panel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin8"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.coin8Panel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onCrossCraftCoinClick")
				}
			}
		}
	},
	crossArena = {
		["rightTopPanel.coin8Panel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin12"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.coin8Panel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onCrossArenaCoinClick")
				}
			}
		}
	},
	goldGem = {
		["rightTopPanel.goldGemPanel.btnAdd"] = "goldGemBtnAdd",
		["rightTopPanel.goldGemPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.goldGem] or 0, 2)
				end
			}
		},
		["rightTopPanel.goldGemPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onGoldGemClick")
				}
			}
		}
	},
	rmbGem = {
		["rightTopPanel.rmbGemPanel.btnAdd"] = "rmbGemBtnAdd",
		["rightTopPanel.rmbGemPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.rmbGem] or 0, 2)
				end
			}
		},
		["rightTopPanel.rmbGemPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onRmbGemClick")
				}
			}
		}
	},
	passportCoin = {
		["rightTopPanel.coinPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.passportCoin] or 0, 2)
				end
			}
		},
		["rightTopPanel.coinPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onCoinClick")
				}
			}
		}
	},
	passportVipCoin = {
		["rightTopPanel.coinVipPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[game.ITEM_TICKET.passportVipCoin] or 0, 2)
				end
			}
		},
		["rightTopPanel.coinVipPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onVipCoinClick")
				}
			}
		}
	},
	fishingGold = {
		["rightTopPanel.fishingSilverPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[535] or 0, 2)
				end
			}
		},
		["rightTopPanel.fishingSilverPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onBtnClick")
				}
			}
		},
		["rightTopPanel.fishingGoldPanel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "items"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0[534] or 0, 2)
				end
			}
		},
		["rightTopPanel.fishingGoldPanel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onBtnClick")
				}
			}
		}
	},
	onlineFight = {
		["rightTopPanel.coin8Panel.num"] = {
			binds = {
				event = "text",
				idler = bindHelper.model("role", "coin12"),
				method = function (slot0)
					return mathEasy.getShortNumber(slot0, 2)
				end
			}
		},
		["rightTopPanel.coin8Panel"] = {
			binds = {
				event = "touch",
				methods = {
					ended = bindHelper.self("onOnlineFightCoinClick")
				}
			}
		}
	},
	gridWalk = {
		["rightTopPanel.gridWalkPanel.num"] = "num1"
	},
	actionPoint = {
		["rightTopPanel.actionPointPanel.num"] = "num1"
	}
}
