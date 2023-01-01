settings {
    "main": {
        "description": "Code: GGSYK Version: 1.0.0 - Updated for OW2 by Jorkol",
        "modeName": "Aim training"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "mapRotation": "paused",
        "team1Slots": 4,
        "team2Slots": 0,
        "returnToLobby": "never"
    },
    "gamemodes": {
        "skirmish": {
            "enabledMaps": [
                "workshopChamber"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
        }
    },
    "heroes": {
        "team1": {
            "pharah": {
                "ability1Cooldown%": 101,
                "enableInfiniteAmmo": true
            }
        },
        "team2": {
            "doomfist": {
                "ability1Cooldown%": 101,
                "ability2Cooldown%": 101
            },
            "pharah": {
                "secondaryFireMaximumTime%": 500,
                "secondaryFireRechargeRate%": 500,
                "ability1Cooldown%": 0,
                "enableInfiniteAmmo": true
            }
        },
        "allTeams": {
            "ana": {
                "enableInfiniteAmmo": true
            },
            "ashe": {
                "enableInfiniteAmmo": true
            },
            "baptiste": {
                "enableInfiniteAmmo": true
            },
            "mccree": {
                "enableInfiniteAmmo": true
            },
            "echo": {
                "enableInfiniteAmmo": true
            },
            "genji": {
                "enableInfiniteAmmo": true
            },
            "junkrat": {
                "enableInfiniteAmmo": true
            },
            "lucio": {
                "enableInfiniteAmmo": true
            },
            "mei": {
                "enableInfiniteAmmo": true
            },
            "mercy": {
                "enableInfiniteAmmo": true
            },
            "orisa": {
                "enableInfiniteAmmo": true
            },
            "reaper": {
                "enableInfiniteAmmo": true
            },
            "roadhog": {
                "enableInfiniteAmmo": true
            },
            "symmetra": {
                "enableInfiniteAmmo": true
            },
            "torbjorn": {
                "enableInfiniteAmmo": true
            },
            "widowmaker": {
                "enableInfiniteAmmo": true
            },
            "zarya": {
                "enableInfiniteAmmo": true
            },
            "zenyatta": {
                "enableInfiniteAmmo": true
            },
            "general": {
                "abilityCooldown%": 0,
                "enableSpawningWithUlt": true,
                "ultGen%": 500,
                "combatUltGen%": 500,
                "passiveUltGen%": 500
            }
        }
    }
}

#Global variables

globalvar MoveMinWait 0
globalvar MoveMaxWait 1
globalvar RandomJumping 2
globalvar JumpMinWait 3
globalvar JumpMaxWait 4
globalvar CustomNames 5
globalvar SpawnAsTank 6
globalvar SpawnAsSupport 7
globalvar SpawnAsDps 8
globalvar HeroList 9
globalvar BotAbilitiesEnabled 10
globalvar RandomCrouching 11
globalvar PlayerImmunity 12
globalvar CrouchMaxWait 13
globalvar NumberOfBots 14
globalvar HeroesInPlay 15
globalvar LoopNumber 16
globalvar NextHero 17
globalvar DamageNumbers 18
globalvar IntroHud 19
globalvar Dif1 20
globalvar Dif2 21
globalvar Dif3 22
globalvar Dif4 23
globalvar Speedboost 24
globalvar Symmetra 25
globalvar Playerlist 26
globalvar Roadhog 29
globalvar Sigma 30
globalvar Winston 31
globalvar WreckingBall 32
globalvar Zarya 33
globalvar Ashe 34
globalvar Bastion 35
globalvar Doomfist 36
globalvar Echo 37
globalvar Genji 38
globalvar Hanzo 39
globalvar Junkrat 40
globalvar McCree 41
globalvar Mei 42
globalvar Pharah 43
globalvar Reaper 44
globalvar Soldier 45
globalvar Sombra 46
globalvar Torb 48
globalvar Tracer 49
globalvar Widow 50
globalvar Ana 51
globalvar Baptiste 52
globalvar Brigitte 53
globalvar Lucio 54
globalvar Mercy 55
globalvar Moira 56
globalvar Zenyatta 57
globalvar Speedcolor 58
globalvar Dva 59
globalvar Orisa 60
globalvar Reinhardt 61
globalvar Kiriko 62
globalvar Sojourn 63


#Player variables

playervar Timer 0
playervar Kills 1
playervar Randomizer 2
playervar NanoBoost 3
playervar MercyBoost 4
playervar HeroList 5
playervar SpeedColor 6
playervar SpeedBoost 7
playervar PathLoc 8
playervar PathHelper 9
playervar PathDirection 10
playervar PathOld 11
playervar NanoColor 12
playervar MercyColor 13
playervar RecentDamageDealtToSlot 127


#Subroutine names

subroutine AssignNewHero 0


#Activated extensions

#!extension spawnMoreDummyBots


/*
rule "Setup":
*/

rule "Aim training and warm up by Seita":
    @Event playerJoined

    eventPlayer.disableGamemodeHud()


rule "Workshop Settings":
    DamageNumbers = createWorkshopSetting(bool, "Show Damage Numbers", "Show Damage Numbers", true, 0)
    BotAbilitiesEnabled = createWorkshopSetting(bool, "Abilities and immunity", "Bots will use abilities", true, 0)
    PlayerImmunity = createWorkshopSetting(bool, "Abilities and immunity", "Player is immune to CC", true, 0)
    NumberOfBots = createWorkshopSetting(int[1:12], "Number of Bots and custom names", "Number of Bots", 4, 0)
    CustomNames = createWorkshopSetting(bool, "Number of Bots and custom names", "Custom Names for bots", true, 1)
    MoveMinWait = createWorkshopSetting(float[0.1:5], "Bot Movement", "Bot Movement  -  Minimum wait time before changing direction", 0.25, 0)
    MoveMaxWait = createWorkshopSetting(float[0.2:8], "Bot Movement", "Bot Movement  -  Maximum wait time before changing direction", 0.45, 1)
    RandomJumping = createWorkshopSetting(bool, "Bot Movement", "Bot Jumping", true, 2)
    JumpMinWait = createWorkshopSetting(float[1:10], "Bot Movement", "Bot Jumping  -  Minimum wait time before Jumping again", 4.5, 3)
    JumpMaxWait = createWorkshopSetting(float[1.5:20], "Bot Movement", "Bot Jumping  -  Maximum wait time before Jumping", 10, 4)
    RandomCrouching = createWorkshopSetting(bool, "Bot Movement", "Bot Crouching", true, 5)
    CrouchMaxWait = createWorkshopSetting(float[0.25:10], "Bot Movement", "Bot Crouching  -  How often the bot will crouch", 3, 6)


# Preset only diffult heros
rule "Workshop Settings: Heroes":
    /* disabled */
    Brigitte = createWorkshopSetting(bool, "Bot Support Heroes", "Brigitte", false, 0)
    Baptiste = createWorkshopSetting(bool, "Bot Support Heroes", "Baptiste", false, 0)
    Moira = createWorkshopSetting(bool, "Bot Support Heroes", "Moira", false, 0)
    Zenyatta = createWorkshopSetting(bool, "Bot Support Heroes", "Zenyatta", false, 0)
    Dva = createWorkshopSetting(bool, "Bot Tank Heroes", "Dva", false, 0)
    Reinhardt = createWorkshopSetting(bool, "Bot Tank Heroes", "Reinhardt (Rein bot, code - XEEAE)", false, 0)
    Sigma = createWorkshopSetting(bool, "Bot Tank Heroes", "Sigma", false, 0)
    Ashe = createWorkshopSetting(bool, "Bot DPS Heroes", "Ashe", false, 0)
    Bastion = createWorkshopSetting(bool, "Bot DPS Heroes", "Bastion", false, 0)
    Hanzo = createWorkshopSetting(bool, "Bot DPS Heroes", "Hanzo", false, 0)
    Junkrat = createWorkshopSetting(bool, "Bot DPS Heroes", "Junkrat", false, 0)
    McCree = createWorkshopSetting(bool, "Bot DPS Heroes", "McCree", false, 0)
    Mei = createWorkshopSetting(bool, "Bot DPS Heroes", "Mei", false, 0)
    Reaper = createWorkshopSetting(bool, "Bot DPS Heroes", "Reaper", false, 0)
    Soldier = createWorkshopSetting(bool, "Bot DPS Heroes", "Soldier 76", false, 0)
    Sombra = createWorkshopSetting(bool, "Bot DPS Heroes", "Sombra", false, 0)
    Symmetra = createWorkshopSetting(bool, "Bot DPS Heroes", "Symmetra", false, 0)
    Torb = createWorkshopSetting(bool, "Bot DPS Heroes", "Torbjörn", false, 0)
    Widow = createWorkshopSetting(bool, "Bot DPS Heroes", "Widowmaker (Widow Bot, Code - PYDEY)", false, 0)

    /* DPS */
    SpawnAsDps = createWorkshopSetting(bool, "Bot Heroes", "Include enabled DPS heroes", true, 1)
    Echo = createWorkshopSetting(bool, "Bot DPS Heroes", "Echo", true, 0)
    Genji = createWorkshopSetting(bool, "Bot DPS Heroes", "Genji", true, 0)
    Pharah = createWorkshopSetting(bool, "Bot DPS Heroes", "Pharah (Pharah bot, Code - DKKKD)", true, 0)
    Sojourn = createWorkshopSetting(bool, "Bot DPS Heroes", "Sojourn", true, 0)
    Tracer = createWorkshopSetting(bool, "Bot DPS Heroes", "Tracer", true, 0)

    /* Supports */
    SpawnAsSupport = createWorkshopSetting(bool, "Bot Heroes", "Include enabled Support heroes", true, 2)
    Ana = createWorkshopSetting(bool, "Bot Support Heroes", "Ana", true, 0)
    Kiriko = createWorkshopSetting(bool, "Bot Support Heroes", "Kiriko", true, 0)
    Lucio = createWorkshopSetting(bool, "Bot Support Heroes", "Lúcio", true, 0)
    Mercy = createWorkshopSetting(bool, "Bot Support Heroes", "Mercy", true, 0)

    /* Tanks */
    SpawnAsTank = createWorkshopSetting(bool, "Bot Heroes", "Include enabled Tank heroes", false, 3)
    Doomfist = createWorkshopSetting(bool, "Bot Tank Heroes", "Doomfist", true, 0)
    Roadhog = createWorkshopSetting(bool, "Bot Tank Heroes", "Roadhog", true, 0)
    Orisa = createWorkshopSetting(bool, "Bot Tank Heroes", "Orisa", true, 0)
    Winston = createWorkshopSetting(bool, "Bot Tank Heroes", "Winston", true, 0)
    WreckingBall = createWorkshopSetting(bool, "Bot Tank Heroes", "Wrecking Ball", true, 0)
    Zarya = createWorkshopSetting(bool, "Bot Tank Heroes", "Zarya", true, 0)

# # Preset varied heros
# rule "Workshop Settings: Heroes":
#     /* disabled */
#     Brigitte = createWorkshopSetting(bool, "Bot Support Heroes", "Brigitte", false, 0)
#     Dva = createWorkshopSetting(bool, "Bot Tank Heroes", "Dva", false, 0)
#     Reinhardt = createWorkshopSetting(bool, "Bot Tank Heroes", "Reinhardt (Rein bot, code - XEEAE)", false, 0)
#     Sigma = createWorkshopSetting(bool, "Bot Tank Heroes", "Sigma", false, 0)

#     /* DPS */
#     SpawnAsDps = createWorkshopSetting(bool, "Bot Heroes", "Include enabled DPS heroes", true, 1)
#     Ashe = createWorkshopSetting(bool, "Bot DPS Heroes", "Ashe", true, 0)
#     Bastion = createWorkshopSetting(bool, "Bot DPS Heroes", "Bastion", true, 0)
#     Echo = createWorkshopSetting(bool, "Bot DPS Heroes", "Echo", true, 0)
#     Genji = createWorkshopSetting(bool, "Bot DPS Heroes", "Genji", true, 0)
#     Hanzo = createWorkshopSetting(bool, "Bot DPS Heroes", "Hanzo", true, 0)
#     Junkrat = createWorkshopSetting(bool, "Bot DPS Heroes", "Junkrat", true, 0)
#     McCree = createWorkshopSetting(bool, "Bot DPS Heroes", "McCree", true, 0)
#     Mei = createWorkshopSetting(bool, "Bot DPS Heroes", "Mei", true, 0)
#     Pharah = createWorkshopSetting(bool, "Bot DPS Heroes", "Pharah (Pharah bot, Code - DKKKD)", true, 0)
#     Reaper = createWorkshopSetting(bool, "Bot DPS Heroes", "Reaper", true, 0)
#     Soldier = createWorkshopSetting(bool, "Bot DPS Heroes", "Soldier 76", true, 0)
#     Sombra = createWorkshopSetting(bool, "Bot DPS Heroes", "Sombra", true, 0)
#     Symmetra = createWorkshopSetting(bool, "Bot DPS Heroes", "Symmetra", true, 0)
#     Sojourn = createWorkshopSetting(bool, "Bot DPS Heroes", "Sojourn", true, 0)
#     Torb = createWorkshopSetting(bool, "Bot DPS Heroes", "Torbjörn", true, 0)
#     Tracer = createWorkshopSetting(bool, "Bot DPS Heroes", "Tracer", true, 0)
#     Widow = createWorkshopSetting(bool, "Bot DPS Heroes", "Widowmaker (Widow Bot, Code - PYDEY)", true, 0)

#     /* Supports */
#     SpawnAsSupport = createWorkshopSetting(bool, "Bot Heroes", "Include enabled Support heroes", true, 2)
#     Ana = createWorkshopSetting(bool, "Bot Support Heroes", "Ana", true, 0)
#     Baptiste = createWorkshopSetting(bool, "Bot Support Heroes", "Baptiste", true, 0)
#     Kiriko = createWorkshopSetting(bool, "Bot Support Heroes", "Kiriko", true, 0)
#     Lucio = createWorkshopSetting(bool, "Bot Support Heroes", "Lúcio", true, 0)
#     Mercy = createWorkshopSetting(bool, "Bot Support Heroes", "Mercy", true, 0)
#     Moira = createWorkshopSetting(bool, "Bot Support Heroes", "Moira", true, 0)
#     Zenyatta = createWorkshopSetting(bool, "Bot Support Heroes", "Zenyatta", true, 0)

#     /* Tanks */
#     SpawnAsTank = createWorkshopSetting(bool, "Bot Heroes", "Include enabled Tank heroes", false, 3)
#     Doomfist = createWorkshopSetting(bool, "Bot Tank Heroes", "Doomfist", true, 0)
#     Roadhog = createWorkshopSetting(bool, "Bot Tank Heroes", "Roadhog", true, 0)
#     Orisa = createWorkshopSetting(bool, "Bot Tank Heroes", "Orisa", true, 0)
#     Winston = createWorkshopSetting(bool, "Bot Tank Heroes", "Winston", true, 0)
#     WreckingBall = createWorkshopSetting(bool, "Bot Tank Heroes", "Wrecking Ball", true, 0)
#     Zarya = createWorkshopSetting(bool, "Bot Tank Heroes", "Zarya", true, 0)


rule "Creating Hero List: Spawn as Random Dps":
    @Condition SpawnAsDps == true

    if Symmetra == true:
        HeroList.append(Hero.SYMMETRA)
    if Ashe == true:
        HeroList.append(Hero.ASHE)
    if Bastion == true:
        HeroList.append(Hero.BASTION)
    if Echo == true:
        HeroList.append(Hero.ECHO)
    if Genji == true:
        HeroList.append(Hero.GENJI)
    if Hanzo == true:
        HeroList.append(Hero.HANZO)
    if Junkrat == true:
        HeroList.append(Hero.JUNKRAT)

    if McCree == true:
        HeroList.append(Hero.MCCREE)
    if Mei == true:
        HeroList.append(Hero.MEI)
    if Pharah == true:
        HeroList.append(Hero.PHARAH)
    if Reaper == true:
        HeroList.append(Hero.REAPER)
    if Soldier == true:
        HeroList.append(Hero.SOLDIER)
    if Sombra == true:
        HeroList.append(Hero.SOMBRA)
    if Sojourn == true:
        HeroList.append(Hero.SOJOURN)
    if Torb == true:
        HeroList.append(Hero.TORBJORN)
    if Tracer == true:
        HeroList.append(Hero.TRACER)
    if Widow == true:
        HeroList.append(Hero.WIDOWMAKER)


rule "Creating Hero List: Spawn as Random Support":
    @Condition SpawnAsSupport == true

    if Ana == true:
        HeroList.append(Hero.ANA)
    if Baptiste == true:
        HeroList.append(Hero.BAPTISTE)
    if Brigitte == true:
        HeroList.append(Hero.BRIGITTE)
    if Kiriko == true:
        HeroList.append(Hero.KIRIKO)
    if Lucio == true:
        HeroList.append(Hero.LUCIO)
    if Mercy == true:
        HeroList.append(Hero.MERCY)
    if Moira == true:
        HeroList.append(Hero.MOIRA)
    if Zenyatta == true:
        HeroList.append(Hero.ZENYATTA)


rule "Creating Hero List: Spawn as Random Tank":
    @Condition SpawnAsTank == true

    if Dva == true:
        HeroList.append(Hero.DVA)
    if Doomfist == true:
        HeroList.append(Hero.DOOMFIST)
    if Orisa == true:
        HeroList.append(Hero.ORISA)
    if Reinhardt == true:
        HeroList.append(Hero.REINHARDT)
    if Roadhog == true:
        HeroList.append(Hero.ROADHOG)
    if Sigma == true:
        HeroList.append(Hero.SIGMA)
    if Winston == true:
        HeroList.append(Hero.WINSTON)
    if WreckingBall == true:
        HeroList.append(Hero.HAMMOND)
    if Zarya == true:
        HeroList.append(Hero.ZARYA)


rule "Creating Hero List: Randomize":
    del HeroList[0]
    HeroList = random.shuffle(HeroList)


/*
rule "Player":
*/

rule "Show Player Damage by BluJay (https://workshop.codes/7CZFC)":
    @Event eachPlayer
    @Team 2
    @Condition DamageNumbers == true

    createInWorldText(null if localPlayer.RecentDamageDealtToSlot[eventPlayer.getSlot()] == 0 or localPlayer == eventPlayer else localPlayer, round(localPlayer.RecentDamageDealtToSlot[eventPlayer.getSlot()]), eventPlayer, 2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


rule "Player Took Damage by BluJay (https://workshop.codes/7CZFC)":
    @Event playerTookDamage
    @Team 2
    @Condition DamageNumbers == true

    attacker.RecentDamageDealtToSlot[victim.getSlot()] += eventDamage
    wait(1.5, Wait.RESTART_WHEN_TRUE)
    attacker.RecentDamageDealtToSlot[victim.getSlot()] = 0


rule "Not taking damage and healing":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true

    eventPlayer.setDamageReceived(1)
    eventPlayer.startHoT(eventPlayer, 9999, 100)


rule "Timer Start":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.Timer == 0

    chase(eventPlayer.Timer, 9999, rate=1, ChaseReeval.DESTINATION_AND_RATE)


rule "Ultimate Refresh":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == true

    wait(0.1)
    eventPlayer.setUltCharge(100)


rule "Ultimate Refresh":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == false

    eventPlayer.setUltCharge(100)


rule "Elimination":
    @Event playerDealtFinalBlow
    @Team 1

    eventPlayer.Kills += 1


rule "HUD Intro":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition eventPlayer.hasSpawned() == true

    hudHeader(getAllPlayers(), "Go to workshop settings to change bot behaviour, heroes and more", HudPosition.TOP, 22, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    IntroHud[0] = getLastCreatedText()
    hudSubtext(getAllPlayers(), "workshop.codes/aimtrain for full description", HudPosition.TOP, 23, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    IntroHud[1] = getLastCreatedText()
    wait(10)
    destroyHudText(IntroHud[0])
    destroyHudText(IntroHud[1])
    wait(30)


rule "HUD Global":
    hudSubtext(getAllPlayers(), "Code: VAXTA", HudPosition.RIGHT, 0, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), "twitter.com/Seita_ow", HudPosition.RIGHT, 0.1, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), "Hold  {0}  to change hero".format(buttonString(Button.RELOAD)), HudPosition.LEFT, 20, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), abilityIconString(Hero.ANA, Button.ULTIMATE), vect(-21.5, 24.8, -2), 1.8, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), abilityIconString(Hero.MERCY, Button.SECONDARY_FIRE), vect(-21.5, 24.8, 2), 1.3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), abilityIconString(Hero.LUCIO, Button.ABILITY_1), vect(-21.5, 24.8, 6), 1.8, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "{0} to activate boost".format(buttonString(Button.INTERACT)), vect(-21.5, 28, 2), 1.5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    Playerlist = []


rule "HUD player":
    @Event eachPlayer
    @Team 1

    hudSubheader(eventPlayer, " \n \n \n ", HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer, l"{0} {1}".format("Timer: ", ceil(eventPlayer.Timer)), HudPosition.LEFT, 0.1, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer, l"{0} {1}".format("Kills: ", ceil(eventPlayer.Kills)), HudPosition.LEFT, 0.2, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer, l"{0} {1}".format("Kills per min: ", ceil(eventPlayer.Kills / (eventPlayer.Timer / 60))), HudPosition.LEFT, 0.3, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer, l"{0} {1} {2}".format("Accuracy: ", ceil(100 * eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY)), "%"), HudPosition.LEFT, 0.4, Color.LIME_GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer, l"{0} {1} {2}".format("Crit Accuracy: ", ceil(100 * eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.CRITICAL_HIT_ACCURACY)), "%"), HudPosition.LEFT, 0.5, Color.TURQUOISE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


rule "Hold Reload to Change hero":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true

    wait(0.2, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), "Keep holding reload to change hero")
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    stopChasingVariable(eventPlayer.Timer)
    eventPlayer.Timer = 0
    eventPlayer.Kills = 0
    eventPlayer.HeroList = getAllHeroes()
    eventPlayer.HeroList.remove(eventPlayer.getCurrentHero())
    eventPlayer.setAllowedHeroes(eventPlayer.HeroList)
    Playerlist.remove(eventPlayer)
    wait(0.1)
    eventPlayer.setAllowedHeroes(getAllHeroes())


rule "Player list":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.getCurrentHero() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.hasSpawned() == true

    Playerlist.append(eventPlayer)


rule "Left":
    @Event playerLeft
    @Condition eventPlayer.isDummy() == false

    Playerlist.remove(eventPlayer)


/*
rule "Bot Actions":
*/

rule "Create Bots":
    if NumberOfBots >= 1:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 0, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 2:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 1, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 3:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 2, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 4:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 3, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 5:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 4, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 6:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 5, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 7:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 6, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 8:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 7, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 9:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 8, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 10:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 9, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 11:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 10, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))
    if NumberOfBots >= 12:
        AssignNewHero()
        createDummy(HeroList[NextHero], Team.2, 11, vect(0, 0, 0), vect(0, 0, 0))
        wait(random.randint(0.5, 2))


rule "Bot Hero Swap":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isDead() == true

    eventPlayer.stopForcingButton(Button.CROUCH)
    eventPlayer.stopForcingButton(Button.JUMP)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.stopForcingButton(Button.ABILITY_1)
    eventPlayer.stopForcingButton(Button.ABILITY_2)
    if getNumberOfLivingPlayers(Team.2) <= 1:
        goto lbl_0
    wait(random.uniform(2, 6))
    lbl_0:
    AssignNewHero()
    eventPlayer.startForcingHero(HeroList[NextHero])
    HeroList = random.shuffle(HeroList)
    wait(0.25)
    eventPlayer.resurrect()


def AssignNewHero():
    @Name "SUB: AssignNewHero"

    for LoopNumber in range(len(HeroList)):
        HeroesInPlay[LoopNumber] = getNumberOfHeroes(HeroList[LoopNumber], Team.2)
    if HeroesInPlay.index(0) >= 0:
        NextHero = HeroesInPlay.index(0)
    elif HeroesInPlay.index(1) >= 0:
        NextHero = HeroesInPlay.index(1)
    elif HeroesInPlay.index(2) >= 0:
        NextHero = HeroesInPlay.index(2)
    elif HeroesInPlay.index(3) >= 0:
        NextHero = HeroesInPlay.index(3)
    elif HeroesInPlay.index(4) >= 0:
        NextHero = HeroesInPlay.index(4)
    elif HeroesInPlay.index(5) >= 0:
        NextHero = HeroesInPlay.index(5)
    else:
        NextHero = 0


rule "Bot Pathing Positions 3 8":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.getSlot() == 3 or eventPlayer.getSlot() == 8) == true

    eventPlayer.PathLoc = vect(-19, 1, -19)
    eventPlayer.PathLoc.append(vect(-19, 1, -8.5))
    eventPlayer.PathLoc.append(vect(-19, 1, 0))
    eventPlayer.PathLoc.append(vect(-8.5, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, -8.5))
    eventPlayer.PathLoc.append(vect(0, 1, -19))
    eventPlayer.PathLoc.append(vect(-8.5, 1, -19))
    eventPlayer.PathHelper = 0
    eventPlayer.PathHelper.append(1)
    eventPlayer.PathHelper.append(2)
    eventPlayer.PathHelper.append(3)
    eventPlayer.PathHelper.append(4)
    eventPlayer.PathHelper.append(5)
    eventPlayer.PathHelper.append(6)
    eventPlayer.PathHelper.append(7)


rule "Bot Pathing Positions 4 9":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.getSlot() == 4 or eventPlayer.getSlot() == 9) == true

    eventPlayer.PathLoc = vect(19, 1, 19)
    eventPlayer.PathLoc.append(vect(19, 1, 8.5))
    eventPlayer.PathLoc.append(vect(19, 1, 0))
    eventPlayer.PathLoc.append(vect(8.5, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, 8.5))
    eventPlayer.PathLoc.append(vect(0, 1, 19))
    eventPlayer.PathLoc.append(vect(8.5, 1, 19))
    eventPlayer.PathHelper = 0
    eventPlayer.PathHelper.append(1)
    eventPlayer.PathHelper.append(2)
    eventPlayer.PathHelper.append(3)
    eventPlayer.PathHelper.append(4)
    eventPlayer.PathHelper.append(5)
    eventPlayer.PathHelper.append(6)
    eventPlayer.PathHelper.append(7)


rule "Bot Pathing Positions 5 10":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.getSlot() == 5 or eventPlayer.getSlot() == 10) == true

    eventPlayer.PathLoc = vect(-19, 1, 19)
    eventPlayer.PathLoc.append(vect(-19, 1, 8.5))
    eventPlayer.PathLoc.append(vect(-19, 1, 0))
    eventPlayer.PathLoc.append(vect(-8.5, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, 8.5))
    eventPlayer.PathLoc.append(vect(0, 1, 19))
    eventPlayer.PathLoc.append(vect(-8.5, 1, 19))
    eventPlayer.PathHelper = 0
    eventPlayer.PathHelper.append(1)
    eventPlayer.PathHelper.append(2)
    eventPlayer.PathHelper.append(3)
    eventPlayer.PathHelper.append(4)
    eventPlayer.PathHelper.append(5)
    eventPlayer.PathHelper.append(6)
    eventPlayer.PathHelper.append(7)


rule "Bot Pathing Positions 6 11":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.getSlot() == 6 or eventPlayer.getSlot() == 11) == true

    eventPlayer.PathLoc = vect(19, 1, -19)
    eventPlayer.PathLoc.append(vect(19, 1, -8.5))
    eventPlayer.PathLoc.append(vect(19, 1, 0))
    eventPlayer.PathLoc.append(vect(8.5, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, 0))
    eventPlayer.PathLoc.append(vect(0, 1, -8.5))
    eventPlayer.PathLoc.append(vect(0, 1, -19))
    eventPlayer.PathLoc.append(vect(8.5, 1, -19))
    eventPlayer.PathHelper = 0
    eventPlayer.PathHelper.append(1)
    eventPlayer.PathHelper.append(2)
    eventPlayer.PathHelper.append(3)
    eventPlayer.PathHelper.append(4)
    eventPlayer.PathHelper.append(5)
    eventPlayer.PathHelper.append(6)
    eventPlayer.PathHelper.append(7)


rule "Bot Pathing Positions rest":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getSlot() != 3
    @Condition eventPlayer.getSlot() != 4
    @Condition eventPlayer.getSlot() != 5
    @Condition eventPlayer.getSlot() != 6
    @Condition eventPlayer.getSlot() != 8
    @Condition eventPlayer.getSlot() != 9
    @Condition eventPlayer.getSlot() != 10
    @Condition eventPlayer.getSlot() != 11

    eventPlayer.PathLoc = vect(-19, 1, -19)
    eventPlayer.PathLoc.append(vect(0, 1, -19))
    eventPlayer.PathLoc.append(vect(19, 1, -19))
    eventPlayer.PathLoc.append(vect(19, 1, 0))
    eventPlayer.PathLoc.append(vect(19, 1, 19))
    eventPlayer.PathLoc.append(vect(0, 1, 19))
    eventPlayer.PathLoc.append(vect(-19, 1, 19))
    eventPlayer.PathLoc.append(vect(-19, 1, 0))
    eventPlayer.PathHelper = 0
    eventPlayer.PathHelper.append(1)
    eventPlayer.PathHelper.append(2)
    eventPlayer.PathHelper.append(3)
    eventPlayer.PathHelper.append(4)
    eventPlayer.PathHelper.append(5)
    eventPlayer.PathHelper.append(6)
    eventPlayer.PathHelper.append(7)


rule "Bot Pathing":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true

    eventPlayer.PathHelper.remove(eventPlayer.PathDirection)
    eventPlayer.PathOld = eventPlayer.PathDirection
    eventPlayer.PathDirection = random.choice(eventPlayer.PathHelper)
    eventPlayer.PathHelper.append(eventPlayer.PathOld)
    eventPlayer.startThrottleInDirection(localVector(eventPlayer.PathLoc[eventPlayer.PathDirection], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(MoveMinWait, MoveMaxWait), Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Pathing too close":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer.getPosition(), eventPlayer.PathLoc[eventPlayer.PathDirection]) <= 1.5

    eventPlayer.PathHelper.remove(eventPlayer.PathDirection)
    eventPlayer.PathOld = eventPlayer.PathDirection
    eventPlayer.PathDirection = random.choice(eventPlayer.PathHelper)
    eventPlayer.PathHelper.append(eventPlayer.PathOld)
    eventPlayer.startThrottleInDirection(localVector(eventPlayer.PathLoc[eventPlayer.PathDirection], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(1, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Facing":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() != Hero.MERCY

    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getPlayersInSlot(0, Team.1).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted([player for player in getLivingPlayers(Team.1) if player.isDummy() == false], lambda i: distance(eventPlayer.getEyePosition(), i.getEyePosition())))[0]).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted(Playerlist, lambda player: distance(eventPlayer.getEyePosition(), player.getEyePosition()))[0].getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Bot Jumping":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition RandomJumping == true
    @Condition eventPlayer.getCurrentHero() != Hero.GENJI
    @Condition eventPlayer.getCurrentHero() != Hero.HANZO
    @Condition eventPlayer.getCurrentHero() != Hero.BAPTISTE
    @Condition eventPlayer.getCurrentHero() != Hero.MERCY
    @Condition eventPlayer.getCurrentHero() != Hero.ECHO

    wait(random.uniform(JumpMinWait, JumpMaxWait), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.JUMP)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Crouching":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition RandomCrouching == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.getCurrentHero() != Hero.BAPTISTE
    @Condition eventPlayer.getCurrentHero() != Hero.ECHO
    @Condition eventPlayer.getCurrentHero() != Hero.PHARAH

    wait(random.uniform(0, CrouchMaxWait), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.CROUCH)
    wait(random.uniform(0.25, 0.65))
    eventPlayer.stopForcingButton(Button.CROUCH)
    wait(0.35, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Teleport":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true

    eventPlayer.teleport(random.choice(eventPlayer.PathLoc))


/*
rule "Bot Abilities":
*/

rule "Bot Abilities: Genji Jump":
    @Event eachPlayer
    @Team 2
    @Condition RandomJumping == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0.4, 0.9), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(random.uniform(0.2, 0.5))
    eventPlayer.forceButtonPress(Button.JUMP)


rule "Bot Abilities: Genji Dash":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 15
    @Condition eventPlayer.getEyePosition().y > 4

    eventPlayer.Randomizer = random.randint(0, 1)
    if eventPlayer.Randomizer == 0:
        goto lbl_0
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6)
    lbl_0:
    wait(2)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Genji Deflect":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(8)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: McCree Roll":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.MCCREE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 10))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(4)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: McCree Flash":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.MCCREE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 11
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 2.5))
    if distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) > 11:
        return
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 1)
    wait(10)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Ablities: Mercy Facing":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY

    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getPlayersInSlot(0, Team.1).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted([player for player in getLivingPlayers(Team.2) if distance(eventPlayer.getEyePosition(), player.getEyePosition()) > 2], lambda i: distance(eventPlayer.getEyePosition(), i.getEyePosition())))[0]).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted([player for player in getLivingPlayers(Team.1) if player.isDummy() == false], lambda i: distance(eventPlayer.getEyePosition(), i.getEyePosition())))[0]).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted(getLivingPlayers(Team.2), lambda player: distance(eventPlayer.getEyePosition(), player.getEyePosition()))[0].getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    #wait(5, Wait.ABORT_WHEN_FALSE)
    #goto RULE_START
    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.2).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(0.5)
    eventPlayer.setWeapon(1)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)


rule "Bot Ablities: Mercy Healing":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isAlive() == true

    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setWeapon(1)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(2, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Ablities: Mercy Jump":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true

    wait(random.uniform(2, 5), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.ABILITY_1)
    wait(1.8)
    eventPlayer.stopForcingButton(Button.ABILITY_1)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Ablities: Mercy Hold jump air":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isOnGround() == false

    eventPlayer.startForcingButton(Button.JUMP)


rule "Bot Ablities: Mercy Stop Hold ground":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.isOnGround() == true

    eventPlayer.stopForcingButton(Button.JUMP)


rule "Bot Ablities: Kiriko Suzu":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.KIRIKO
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.4

    wait(random.uniform(0.5, 1.5))

    eventPlayer.forceButtonPress(Button.ABILITY_2)
    eventPlayer.startFacing(vect(0,-1,0), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(0.5)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted(Playerlist, lambda player: distance(eventPlayer.getEyePosition(), player.getEyePosition()))[0].getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 2)
    wait(14)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Ablities: Kiriko Swfit Step":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getCurrentHero() == Hero.KIRIKO
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.7

    wait(random.uniform(0, 2))

    # Try jumping 3 times because it doesn't always work

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted([player for player in getLivingPlayers(Team.2) if distance(eventPlayer.getEyePosition(), player.getEyePosition()) > 2], lambda i: distance(eventPlayer.getEyePosition(), i.getEyePosition())))[0]).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait()
    eventPlayer.forceButtonPress(Button.ABILITY_1)

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted([player for player in getLivingPlayers(Team.2) if distance(eventPlayer.getEyePosition(), player.getEyePosition()) > 2], lambda i: distance(eventPlayer.getEyePosition(), i.getEyePosition())))[0]).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait()
    eventPlayer.forceButtonPress(Button.ABILITY_1)

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted([player for player in getLivingPlayers(Team.2) if distance(eventPlayer.getEyePosition(), player.getEyePosition()) > 2], lambda i: distance(eventPlayer.getEyePosition(), i.getEyePosition())))[0]).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait()
    eventPlayer.forceButtonPress(Button.ABILITY_1)


    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted(Playerlist, lambda player: distance(eventPlayer.getEyePosition(), player.getEyePosition()))[0].getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(7)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Sojourn Power Slide":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.SOJOURN
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 10))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(1)
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(7)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Pharah Fly BotUsingFuel Vertical speed < -5.7":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getVerticalSpeed() < -5.7
    @Condition eventPlayer.getCurrentHero() == Hero.PHARAH
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.isOnGround() == false
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.startForcingButton(Button.JUMP)


rule "Bot Abilities: Pharah Fly BotUsingFuel, Stop - Vertical speed > 3.5":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getVerticalSpeed() > 3.5
    @Condition eventPlayer.getCurrentHero() == Hero.PHARAH
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.isOnGround() == false
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.stopForcingButton(Button.JUMP)


rule "Bot Abilities: Pharah Fly Bot JumpJet2":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getEyePosition().y < 5.5
    @Condition eventPlayer.getCurrentHero() == Hero.PHARAH
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(3)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Ana Sleep":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.ANA
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 20
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 2.5))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 2)
    wait(10)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Ana Zoom":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.ANA
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(0.9)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    wait(3)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Hog Hook":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 20
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 4.5))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 2)
    wait(10)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Sig Rock":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.SIGMA
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 20
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 4.5))
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 3)
    wait(10)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Rein Shatter":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.REINHARDT
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.65
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 20
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.setUltCharge(100)
    wait(random.uniform(0, 1.5))
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 1.5)
    wait(10)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Rein FS":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.REINHARDT
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(random.uniform(0, 6))
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(3)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Rein Charge":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.REINHARDT
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 30))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 3)
    wait(20)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Rein Charge":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.REINHARDT
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) <= 3
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 5))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 3)
    wait(10)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Ball Form piledriver":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.HAMMOND
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(2, 7), Wait.ABORT_WHEN_FALSE)
    if eventPlayer.isInAlternateForm() == true:
        goto lbl_0
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    lbl_0:
    wait(random.uniform(1, 3))
    if eventPlayer.getCurrentHero() != Hero.HAMMOND:
        return
    eventPlayer.applyImpulse(Vector.UP, 20.5, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)
    wait(random.uniform(1, 2))
    if eventPlayer.getCurrentHero() != Hero.HAMMOND:
        return
    eventPlayer.forceButtonPress(Button.CROUCH)
    wait(random.uniform(3, 6))
    if eventPlayer.getCurrentHero() != Hero.HAMMOND:
        return
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Ball Form":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == false
    @Condition eventPlayer.getCurrentHero() == Hero.HAMMOND
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(1, 5), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(random.uniform(1, 5), Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Baptiste Jump":
    @Event eachPlayer
    @Team 2
    @Condition RandomJumping == true
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(3, 5), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.CROUCH)
    wait(random.uniform(0.5, 0.9))
    eventPlayer.stopForcingButton(Button.CROUCH)
    wait(random.uniform(0.1, 0.5))
    eventPlayer.forceButtonPress(Button.JUMP)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Hanzo Jump":
    @Event eachPlayer
    @Team 2
    @Condition RandomJumping == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0.4, 0.9), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(random.uniform(0.2, 0.5))
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(4.4)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Hanzo Shoot":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(0.75)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(0.5)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Echo Fly1":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getEyePosition().y < 3
    @Condition eventPlayer.getCurrentHero() == Hero.ECHO
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Echo Fly2":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ECHO
    @Condition eventPlayer.isAlive() == true
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.startForcingButton(Button.JUMP)


rule "Bot Abilities: Doom Punch":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.DOOMFIST
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) <= 20

    wait(random.uniform(0, 10))
    if not RULE_CONDITION:
        return
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(random.uniform(1.4, 1.9))
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 1)
    wait(5, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Doom Uppercut":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.DOOMFIST
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) <= 4.75
    #@Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false

    eventPlayer.forceButtonPress(Button.ABILITY_1)


rule "Bot Abilities: Doom Slam":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.DOOMFIST
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) <= 15
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false

    wait(random.uniform(0, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_2)


rule "Bot Abilities: Doom Uppercut Slam":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.DOOMFIST
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) <= 29
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) >= 18

    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.6)
    eventPlayer.startForcingButton(Button.ABILITY_2)
    wait(0.5)
    eventPlayer.stopForcingButton(Button.ABILITY_2)


rule "Bot Abilities: Tracer Blink":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.TRACER
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(1.5, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Tracer Recall":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.TRACER
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.5

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(7)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Moira":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.MOIRA
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.5

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(7)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Reaper":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.REAPER
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.5

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(7)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Mei":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.MEI
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getNormalizedHealth() <= 0.5

    wait(random.uniform(0, 3), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(7)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Brig Knock":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 19
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 4))
    if not RULE_CONDITION:
        return
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(4)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Brig Bash":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 6.5
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(random.uniform(0, 0.5))
    if PlayerImmunity == true:
        getPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 1)
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(1)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    wait(5)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Widow":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.WIDOWMAKER
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(0.9)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Ashe":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.ASHE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(0.9)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Zen Shoot":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)


rule "Bot Abilities: Orisa":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.ORISA
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.hasSpawned() == true

    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(5)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(5, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Lucio Boop":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.LUCIO
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getNormalizedHealth() != 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 7.75

    wait(random.uniform(0, 3))
    if not RULE_CONDITION:
        return
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    wait(6)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Lucio Speed":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.LUCIO
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 20), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(12)
    if RULE_CONDITION:
        goto RULE_START


rule "Bot Abilities: Winston Jump":
    @Event eachPlayer
    @Team 2
    @Condition BotAbilitiesEnabled == true
    @Condition eventPlayer.getCurrentHero() == Hero.WINSTON
    @Condition eventPlayer.isAlive() == true
    #@Condition eventPlayer.getNormalizedHealth() != 1
    @Condition distance(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getEyePosition(), Team.1)) < 20
    @Condition eventPlayer.hasSpawned() == true

    wait(random.uniform(0, 1))
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6)
    if RULE_CONDITION:
        goto RULE_START


/*
rule "Bot Names":
*/

rule "Bot Names: Ana":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ANA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Jorkol")


rule "Bot Names: Lúcio":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.LUCIO
    @Condition CustomNames == true

    eventPlayer.startForcingName("Funnyastro")


rule "Bot Names: Bap":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition CustomNames == true

    eventPlayer.startForcingName("Alarm")


rule "Bot Names: Zen":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Snorkol")


rule "Bot Names: Mercy":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition CustomNames == true

    eventPlayer.startForcingName("Kitty")


rule "Bot Names: Brig":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition CustomNames == true

    eventPlayer.startForcingName("Biggoose")


rule "Bot Names: Moira":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.MOIRA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Ripa")


rule "Bot Names: Ashe":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ASHE
    @Condition CustomNames == true

    eventPlayer.startForcingName("Kitty")


rule "Bot Names: Bastion":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.BASTION
    @Condition CustomNames == true

    eventPlayer.startForcingName("Architect")


rule "Bot Names: Doomfist":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.DOOMFIST
    @Condition CustomNames == true

    eventPlayer.startForcingName("Dannedd")


rule "Bot Names: Echo":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ECHO
    @Condition CustomNames == true

    eventPlayer.startForcingName("Eqo")


rule "Bot Names: Genji":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition CustomNames == true

    eventPlayer.startForcingName("Picklerisk")


rule "Bot Names: Hanzo":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition CustomNames == true

    eventPlayer.startForcingName("Puppy")


rule "Bot Names: Junkrat":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.JUNKRAT
    @Condition CustomNames == true

    eventPlayer.startForcingName("Baito")


rule "Bot Names: McCree":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.MCCREE
    @Condition CustomNames == true

    eventPlayer.startForcingName("Comet")


rule "Bot Names: Mei":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.MEI
    @Condition CustomNames == true

    eventPlayer.startForcingName("Ricky")


rule "Bot Names: Pharah":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.PHARAH
    @Condition CustomNames == true

    eventPlayer.startForcingName("Jinmu")


rule "Bot Names: Reaper-":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.REAPER
    @Condition CustomNames == true

    eventPlayer.startForcingName("Reaper")


rule "Bot Names: Soldier":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.SOLDIER
    @Condition CustomNames == true

    eventPlayer.startForcingName("Dafran")


rule "Bot Names: Sombra":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.SOMBRA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Danteh")


rule "Bot Names: Symmetra":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.SYMMETRA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Heesu")


rule "Bot Names: Torb-":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.TORBJORN
    @Condition CustomNames == true

    eventPlayer.startForcingName("Torbjörn")


rule "Bot Names: Tracer":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.TRACER
    @Condition CustomNames == true

    eventPlayer.startForcingName("Davin")


rule "Bot Names: Widow":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.WIDOWMAKER
    @Condition CustomNames == true

    eventPlayer.startForcingName("Puppy")


rule "Bot Names: Dva":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.DVA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Fury")


rule "Bot Names: Orisa-":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ORISA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Orisa")


rule "Bot Names: Rein":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.REINHARDT
    @Condition CustomNames == true

    eventPlayer.startForcingName("LhCloudy")


rule "Bot Names: Hog":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition CustomNames == true

    eventPlayer.startForcingName("Hymzi")


rule "Bot Names: Sig":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.SIGMA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Zappis")


rule "Bot Names: Ball":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.HAMMOND
    @Condition CustomNames == true

    eventPlayer.startForcingName("Ameng")


rule "Bot Names: Zarya":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.ZARYA
    @Condition CustomNames == true

    eventPlayer.startForcingName("Poko")


rule "Bot Names: Winston":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.WINSTON
    @Condition CustomNames == true

    eventPlayer.startForcingName("Snork")

rule "Bot Names: Kiriko":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.KIRIKO
    @Condition CustomNames == true

    eventPlayer.startForcingName("Rigid")

rule "Bot Names: Sojourn":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getCurrentHero() == Hero.SOJOURN
    @Condition CustomNames == true

    eventPlayer.startForcingName("Sojourn")
/*
rule "Boosts":
*/

rule "Create Damage boost icons":
    @Event eachPlayer
    @Team 1

    createEffect(eventPlayer, Effect.SPHERE, eventPlayer.NanoColor, vect(-21, 27, -2), 2, EffectReeval.COLOR)
    createEffect(eventPlayer, Effect.SPHERE, eventPlayer.MercyColor, vect(-21, 27, 2), 2, EffectReeval.COLOR)
    createEffect(eventPlayer, Effect.SPHERE, eventPlayer.SpeedColor, vect(-21, 27, 6), 2, EffectReeval.COLOR)
    eventPlayer.NanoColor = Color.RED
    eventPlayer.MercyColor = Color.RED
    eventPlayer.SpeedColor = Color.RED


rule "Activate Ana":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 26, -2)) <= 1.75
    @Condition eventPlayer.NanoBoost == false

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(eventPlayer, "Activating Nano Boost")
    eventPlayer.NanoColor = Color.GREEN
    wait(1)
    createDummy(Hero.ANA, Team.1, eventPlayer.getSlot() + 4, vect(0, 1000, 0), vect(0, 0, 0))
    eventPlayer.NanoBoost = true


rule "Deactivate Ana":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 26, -2)) <= 1.75
    @Condition eventPlayer.NanoBoost == true

    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(eventPlayer, "Deactivating Nano Boost")
    eventPlayer.NanoColor = Color.RED
    wait(1)
    destroyDummy(Team.1, eventPlayer.getSlot() + 4)
    eventPlayer.NanoBoost = false


rule "Activate Mercy":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 26, 2)) <= 1.75
    @Condition eventPlayer.MercyBoost == false

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Activating Mercy Damage Boost")
    eventPlayer.MercyColor = Color.GREEN
    wait(1)
    createDummy(Hero.MERCY, Team.1, eventPlayer.getSlot() + 8, vect(0, 1000, 0), vect(0, 0, 0))
    eventPlayer.MercyBoost = true


rule "Deactivate Mercy":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 26, 2)) <= 1.75
    @Condition eventPlayer.MercyBoost == true

    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Deactivating Mercy Damage Boost")
    eventPlayer.MercyColor = Color.RED
    wait(1)
    destroyDummy(Team.1, eventPlayer.getSlot() + 8)
    eventPlayer.MercyBoost = false


rule "Activate Speed":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 26, 6)) <= 1.75
    @Condition eventPlayer.SpeedBoost == false

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(eventPlayer, "Activating 25% Speed boost")
    eventPlayer.setMoveSpeed(125)
    eventPlayer.SpeedColor = Color.GREEN
    wait(1)
    eventPlayer.SpeedBoost = true


rule "Deactivate Speed":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 26, 6)) <= 1.75
    @Condition eventPlayer.SpeedBoost == true

    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(eventPlayer, "Deactivating Speed boost")
    eventPlayer.SpeedColor = Color.RED
    eventPlayer.setMoveSpeed(100)
    wait(1)
    eventPlayer.SpeedBoost = false


rule "Ana Nano boost action":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition (getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1)).isAlive() == true
    @Condition (getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1)).hasSpawned() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ANA

    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), (getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1)).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.attachTo(getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1), vect(0, 5, 0))
    eventPlayer.setUltCharge(100)
    wait(0.25)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(8, Wait.ABORT_WHEN_FALSE)
    goto RULE_START


rule "Mercy Damage boost action":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition (getPlayersInSlot(eventPlayer.getSlot() - 8, Team.1)).isAlive() == true
    @Condition (getPlayersInSlot(eventPlayer.getSlot() - 8, Team.1)).hasSpawned() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY

    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), (getPlayersInSlot(eventPlayer.getSlot() - 8, Team.1)).getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.attachTo(getPlayersInSlot(eventPlayer.getSlot() - 8, Team.1), ((getPlayersInSlot(eventPlayer.getSlot() - 8, Team.1)).getFacingDirection()) * -2)
    wait(0.25)
    eventPlayer.setWeapon(1)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)


rule "Activate Speed for bots":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 34, -14.5)) <= 1.75
    @Condition Speedboost == false

    playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Activating 25% Speed boost for bots")
    getPlayers(Team.2).setMoveSpeed(125)
    Speedcolor = Color.GREEN
    wait(1)
    Speedboost = true


rule "Deactivate Speed for bots":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-20, 34, -14.5)) <= 1.75
    @Condition Speedboost == true

    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Deactivating Speed boost for bots")
    Speedcolor = Color.RED
    getPlayers(Team.2).setMoveSpeed(100)
    wait(1)
    Speedboost = false


/*
rule "Bot movement difficulty":
*/

rule "Create Dif Icons":
    wait(4)
    createEffect(getAllPlayers(), Effect.SPHERE, Speedcolor, vect(-21, 34, -14.5), 2, EffectReeval.COLOR)
    Speedcolor = Color.RED
    createInWorldText(getAllPlayers(), abilityIconString(Hero.LUCIO, Button.ABILITY_1), vect(-21.5, 31.25, -14.5), 1.8, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.LIME_GREEN, vect(-21, 27, -10), 1.5, EffectReeval.COLOR)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, vect(-21, 27, -13), 1.5, EffectReeval.COLOR)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.ORANGE, vect(-21, 27, -16), 1.5, EffectReeval.COLOR)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, vect(-21, 27, -19), 1.5, EffectReeval.COLOR)
    createInWorldText(getAllPlayers(), "Bot movement", vect(-21.5, 29, -14.5), 1.3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "{0} to change".format(buttonString(Button.INTERACT)), vect(-21.5, 27, -14.5), 1.3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "v.easy", vect(-21.5, 24.8, -10), 1.1, Clip.NONE, WorldTextReeval.COLOR, Dif1, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "easy", vect(-21.5, 24.8, -13), 1.1, Clip.NONE, WorldTextReeval.COLOR, Dif2, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "norm", vect(-21.5, 24.8, -16), 1.1, Clip.NONE, WorldTextReeval.COLOR, Dif3, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "hard", vect(-21.5, 24.8, -19), 1.1, Clip.NONE, WorldTextReeval.VISIBILITY_AND_COLOR, Dif4, SpecVisibility.DEFAULT)
    Dif1 = Color.WHITE
    Dif2 = Color.WHITE
    Dif3 = Color.WHITE
    Dif4 = Color.WHITE
    if MoveMaxWait >= 3.5:
        Dif1 = Color.YELLOW
    elif MoveMaxWait >= 1.75:
        Dif2 = Color.YELLOW
    elif MoveMaxWait >= 0.8:
        Dif3 = Color.YELLOW
    elif MoveMaxWait <= 0.5:
        Dif4 = Color.YELLOW


rule "Set Dif1":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-21, 27, -10)) <= 1.5
    @Condition MoveMaxWait != 3.5

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Very easy movement pattern: Bots rarely change direction")
    MoveMinWait = 1.5
    MoveMaxWait = 3.5
    Dif1 = Color.YELLOW
    Dif2 = Color.WHITE
    Dif3 = Color.WHITE
    Dif4 = Color.WHITE
    wait(1)


rule "Set Dif2":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-21, 27, -13)) <= 1.5
    @Condition MoveMaxWait != 1.75

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Easy movement pattern: Bots change direction 0.75-1.75s")
    MoveMinWait = 0.75
    MoveMaxWait = 1.75
    Dif1 = Color.WHITE
    Dif2 = Color.YELLOW
    Dif3 = Color.WHITE
    Dif4 = Color.WHITE
    wait(1)


rule "Set Dif3":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-21, 27, -16)) <= 1.5
    @Condition MoveMaxWait != 0.8

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Normal movement pattern: Bots change direction 0.4 - 0.8s")
    MoveMinWait = 0.4
    MoveMaxWait = 0.8
    Dif1 = Color.WHITE
    Dif2 = Color.WHITE
    Dif3 = Color.YELLOW
    Dif4 = Color.WHITE
    wait(1)


rule "Set Dif4":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, null, eventPlayer, false).getHitPosition(), vect(-21, 27, -19)) <= 1.5
    @Condition MoveMaxWait != 0.45

    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    smallMessage(getAllPlayers(), "Hard movement pattern: Bots change direction 0.25 - 0.45s")
    MoveMinWait = 0.25
    MoveMaxWait = 0.45
    Dif1 = Color.WHITE
    Dif2 = Color.WHITE
    Dif3 = Color.WHITE
    Dif4 = Color.YELLOW
    wait(1)
