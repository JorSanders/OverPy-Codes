settings {
    "main": {
        "description": "Code: 1152G Version: 1.0.0 - Updated for OW2 by Jorkol",
        "modeName": "1v1 Arena"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "ffaSlots": 8,
        "spectatorSlots": 12,
        "returnToLobby": "never"
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "lijiangControlCenter"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "enableKillCam": false,
            "enableRandomHeroes": true,
            "scoreToWin": 50,
            "enableSelfInitiatedRespawn": false,
            "spawnHealthPacks": "disabled"
        }
    },
    "heroes": {
        "allTeams": {
            "ashe": {
                "ultDuration%": 50
            },
            "baptiste": {
                "enableAbility2": false
            },
            "genji": {
                "ultDuration%": 75
            },
            "soldier": {
                "ultDuration%": 75
            },
            "widowmaker": {
                "ability1Cooldown%": 30,
            },
            "enabledHeroes": [
                "ana",
                "ashe",
                "baptiste",
                "mccree",
                "echo",
                "genji",
                "hanzo",
                "soldier",
                "tracer",
                "widowmaker",
                "zenyatta",
                "kiriko",
                "genji"
            ],
            "general": {
                "combatUltGen%": 200,
                "passiveUltGen%": 0
            }
        }
    }
}

#Global variables

globalvar MainCenter 0
globalvar MainHigh 1
globalvar MainTopDeck 2
globalvar SideArenaCenter 3
globalvar SideArenaSpawnsFacing 4
globalvar MainFacing 5
globalvar HeroList 6
globalvar FirstMatch 7
globalvar MainSpawnDetLoc 8
globalvar MainTopSpawn 9
globalvar BurnDamage 10
globalvar MainOppositeSpawn 11
globalvar IntroHud 12
globalvar MainDeckSpawn 14
globalvar MainDefaultSpawn 16
globalvar SpecSpot2 20
globalvar SpecSpot 21
globalvar Arena1Q 22
globalvar Arena2Q 23
globalvar Arena3Q 24
globalvar Arena1Match 26
globalvar Arena2Match 27
globalvar Arena3Match 28
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
globalvar PathLoc 47
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
globalvar OneHero 58
globalvar Dva 59
globalvar Orisa 60
globalvar Reinhardt 61
globalvar PathHelper 62
globalvar PathDirection 63
globalvar PathOld 64
globalvar HostHasDifferentheroes 65
globalvar PathLocStairs 66
globalvar PathLocDeck 67
globalvar BotSeePlayer 68
globalvar PredictionSpot 69
globalvar Roadhog2 70
globalvar Sigma2 71
globalvar Winston2 72
globalvar WreckingBall2 73
globalvar Zarya2 74
globalvar Ashe2 75
globalvar Bastion2 76
globalvar Doomfist2 77
globalvar Echo2 78
globalvar Genji2 79
globalvar Hanzo2 80
globalvar Junkrat2 81
globalvar McCree2 82
globalvar Mei2 83
globalvar Pharah2 84
globalvar Reaper2 85
globalvar Soldier2 86
globalvar Sombra2 87
globalvar Torb2 88
globalvar Tracer2 89
globalvar Widow2 90
globalvar Ana2 91
globalvar Baptiste2 92
globalvar Brigitte2 93
globalvar Lucio2 94
globalvar Mercy2 95
globalvar Moira2 96
globalvar Zenyatta2 97
globalvar Dva2 98
globalvar Orisa2 99
globalvar Reinhardt2 100
globalvar OneHero2 101
globalvar HeroList2 102
globalvar AlwaysRefreshHero 103
globalvar Sojourn 104
globalvar Kiriko 105


#Player variables

playervar OneHeroPlayerVariable 0
playervar Randomizer 2
playervar Spectating 3
playervar DeadHelper 4
playervar Hud 7
playervar JoinSpecHelper 9
playervar HeroList 11
playervar HeroNumber 13
playervar Score 18
playervar UltCharge 20
playervar AntiHealDebuffed 26


#Subroutine names

subroutine SpawnLocationCheck 0
subroutine Arena1Dies 1
subroutine Arena2Dies 2
subroutine Arena3Dies 3
subroutine StartFacing 4
subroutine ZenShoot 5


rule "Workshop Settings --------------------------------------------------------------------------------------":
    disableInspector()
    /* Tanks */
    Dva = createWorkshopSetting(bool, "Tanks", "Dva", false, 0)
    Doomfist = createWorkshopSetting(bool, "Tanks", "Doomfist", false, 0)
    Orisa = createWorkshopSetting(bool, "Tanks", "Orisa", false, 0)
    Reinhardt = createWorkshopSetting(bool, "Tanks", "Reinhardt", false, 0)
    Roadhog = createWorkshopSetting(bool, "Tanks", "Roadhog", false, 0)
    Sigma = createWorkshopSetting(bool, "Tanks", "Sigma", false, 0)
    Winston = createWorkshopSetting(bool, "Tanks", "Winston", false, 0)
    WreckingBall = createWorkshopSetting(bool, "Tanks", "Wrecking Ball", false, 0)
    Zarya = createWorkshopSetting(bool, "Tanks", "Zarya", false, 0)

    /* DPS disabled */
    Bastion = createWorkshopSetting(bool, "DPS", "Bastion", false, 0)
    Junkrat = createWorkshopSetting(bool, "DPS", "Junkrat", false, 0)
    Mei = createWorkshopSetting(bool, "DPS", "Mei", false, 0)
    Pharah = createWorkshopSetting(bool, "DPS", "Pharah", false, 0)
    Reaper = createWorkshopSetting(bool, "DPS", "Reaper", false, 0)
    Sombra = createWorkshopSetting(bool, "DPS", "Sombra", false, 0)
    Torb = createWorkshopSetting(bool, "DPS", "Torbjörn", false, 0)

    /* DPS enabled */
    Ashe = createWorkshopSetting(bool, "DPS", "Ashe", true, 0)
    Echo = createWorkshopSetting(bool, "DPS", "Echo", true, 0)
    Genji = createWorkshopSetting(bool, "DPS", "Genji", true, 0)
    Hanzo = createWorkshopSetting(bool, "DPS", "Hanzo", true, 0)
    McCree = createWorkshopSetting(bool, "DPS", "McCree", true, 0)
    Soldier = createWorkshopSetting(bool, "DPS", "Soldier 76", true, 0)
    Sojourn = createWorkshopSetting(bool, "DPS", "Sojourn", true, 0)
    Tracer = createWorkshopSetting(bool, "DPS", "Tracer", true, 0)
    Widow = createWorkshopSetting(bool, "DPS", "Widowmaker", true, 0)

    /* Supports disabled */
    Brigitte = createWorkshopSetting(bool, "Supports", "Brigitte", false, 0)
    Lucio = createWorkshopSetting(bool, "Supports", "Lúcio", false, 0)
    Mercy = createWorkshopSetting(bool, "Supports", "Mercy", false, 0)
    Moira = createWorkshopSetting(bool, "Supports", "Moira", false, 0)

    /* Supports enabled */
    Ana = createWorkshopSetting(bool, "Supports", "Ana", true, 0)
    Baptiste = createWorkshopSetting(bool, "Supports", "Baptiste", true, 0)
    Kiriko = createWorkshopSetting(bool, "Supports", "Kiriko", true, 0)
    Zenyatta = createWorkshopSetting(bool, "Supports", "Zenyatta", true, 0)

    BurnDamage = createWorkshopSetting(int[25:200], "Burn Damage", "Damage per tick", 25, 0)
    AlwaysRefreshHero = createWorkshopSetting(bool, "Always refresh hero (cooldowns, shield, etc) after winning on arena 1", "Refresh hero after winning on arena 1", false, 0)
    HostHasDifferentheroes = createWorkshopSetting(bool, "Special settings for mode where players have different list of heroes", "Host player has different list of heroes", false, 0)
    Dva2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Dva.", false, 0)
    Orisa2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Orisa.", false, 0)
    Reinhardt2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Reinhardt.", false, 0)
    Roadhog2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Roadhog.", false, 0)
    Sigma2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Sigma.", false, 0)
    Winston2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Winston.", false, 0)
    WreckingBall2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Wrecking Ball.", false, 0)
    Zarya2 = createWorkshopSetting(bool, "Host only heroes Tanks", "Zarya.", false, 0)
    Ashe2 = createWorkshopSetting(bool, "Host only heroes DPS", "Ashe.", true, 0)
    Bastion2 = createWorkshopSetting(bool, "Host only heroes DPS", "Bastion.", false, 0)
    Doomfist2 = createWorkshopSetting(bool, "Host only heroes DPS", "Doomfist.", false, 0)
    Echo2 = createWorkshopSetting(bool, "Host only heroes DPS", "Echo.", true, 0)
    Genji2 = createWorkshopSetting(bool, "Host only heroes DPS", "Genji.", true, 0)
    Hanzo2 = createWorkshopSetting(bool, "Host only heroes DPS", "Hanzo.", true, 0)
    Junkrat2 = createWorkshopSetting(bool, "Host only heroes DPS", "Junkrat.", false, 0)
    McCree2 = createWorkshopSetting(bool, "Host only heroes DPS", "McCree.", true, 0)
    Mei2 = createWorkshopSetting(bool, "Host only heroes DPS", "Mei.", false, 0)
    Pharah2 = createWorkshopSetting(bool, "Host only heroes DPS", "Pharah.", false, 0)
    Reaper2 = createWorkshopSetting(bool, "Host only heroes DPS", "Reaper.", false, 0)
    Soldier2 = createWorkshopSetting(bool, "Host only heroes DPS", "Soldier 76.", true, 0)
    Sombra2 = createWorkshopSetting(bool, "Host only heroes DPS", "Sombra.", false, 0)
    Torb2 = createWorkshopSetting(bool, "Host only heroes DPS", "Torbjörn.", false, 0)
    Tracer2 = createWorkshopSetting(bool, "Host only heroes DPS", "Tracer.", true, 0)
    Widow2 = createWorkshopSetting(bool, "Host only heroes DPS", "Widowmaker.", true, 0)
    Ana2 = createWorkshopSetting(bool, "Host only heroes Supports", "Ana.", true, 0)
    Baptiste2 = createWorkshopSetting(bool, "Host only heroes Supports", "Baptiste.", true, 0)
    Brigitte2 = createWorkshopSetting(bool, "Host only heroes Supports", "Brigitte.", false, 0)
    Lucio2 = createWorkshopSetting(bool, "Host only heroes Supports", "Lúcio.", false, 0)
    Mercy2 = createWorkshopSetting(bool, "Host only heroes Supports", "Mercy.", false, 0)
    Moira2 = createWorkshopSetting(bool, "Host only heroes Supports", "Moira.", false, 0)
    Zenyatta2 = createWorkshopSetting(bool, "Host only heroes Supports", "Zenyatta.", true, 0)


rule "Creating Herolist, Check OneHero":
    if Doomfist == true:
        HeroList.append(Hero.DOOMFIST)
    if Dva == true:
        HeroList.append(Hero.DVA)
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
    if Sojourn == true:
        HeroList.append(Hero.SOJOURN)
    if Sombra == true:
        HeroList.append(Hero.SOMBRA)
    if Torb == true:
        HeroList.append(Hero.TORBJORN)
    if Tracer == true:
        HeroList.append(Hero.TRACER)
    if Widow == true:
        HeroList.append(Hero.WIDOWMAKER)
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
    del HeroList[0]
    #if len(HeroList) == 1:
    #OneHero = true
    #HeroList.append(HeroList[0])
    #__end__()


rule "Creating Herolist2, Check OneHero2, for host player ----------------------------------------------------------------------------":
    @Condition HostHasDifferentheroes == true

    if Dva2 == true:
        HeroList2.append(Hero.DVA)
    if Orisa2 == true:
        HeroList2.append(Hero.ORISA)
    if Reinhardt2 == true:
        HeroList2.append(Hero.REINHARDT)
    if Roadhog2 == true:
        HeroList2.append(Hero.ROADHOG)
    if Sigma2 == true:
        HeroList2.append(Hero.SIGMA)
    if Winston2 == true:
        HeroList2.append(Hero.WINSTON)
    if WreckingBall2 == true:
        HeroList2.append(Hero.HAMMOND)
    if Zarya2 == true:
        HeroList2.append(Hero.ZARYA)
    if Ashe2 == true:
        HeroList2.append(Hero.ASHE)
    if Bastion2 == true:
        HeroList2.append(Hero.BASTION)
    if Doomfist2 == true:
        HeroList2.append(Hero.DOOMFIST)
    if Echo2 == true:
        HeroList2.append(Hero.ECHO)
    if Genji2 == true:
        HeroList2.append(Hero.GENJI)
    if Hanzo2 == true:
        HeroList2.append(Hero.HANZO)
    if Junkrat2 == true:
        HeroList2.append(Hero.JUNKRAT)
    if McCree2 == true:
        HeroList2.append(Hero.MCCREE)
    if Mei2 == true:
        HeroList2.append(Hero.MEI)
    if Pharah2 == true:
        HeroList2.append(Hero.PHARAH)
    if Reaper2 == true:
        HeroList2.append(Hero.REAPER)
    if Soldier2 == true:
        HeroList2.append(Hero.SOLDIER)
    if Sombra2 == true:
        HeroList2.append(Hero.SOMBRA)
    if Torb2 == true:
        HeroList2.append(Hero.TORBJORN)
    if Tracer2 == true:
        HeroList2.append(Hero.TRACER)
    if Widow2 == true:
        HeroList2.append(Hero.WIDOWMAKER)
    if Ana2 == true:
        HeroList2.append(Hero.ANA)
    if Baptiste2 == true:
        HeroList2.append(Hero.BAPTISTE)
    if Brigitte2 == true:
        HeroList2.append(Hero.BRIGITTE)
    if Lucio2 == true:
        HeroList2.append(Hero.LUCIO)
    if Mercy2 == true:
        HeroList2.append(Hero.MERCY)
    if Moira2 == true:
        HeroList2.append(Hero.MOIRA)
    if Zenyatta2 == true:
        HeroList2.append(Hero.ZENYATTA)
    del HeroList2[0]
    #if len(HeroList2) == 1:
    #OneHero2 = true
    #HeroList2.append(HeroList2[0])
    #__end__()


rule "Disable Scoring":
    disableScoring()
    hudText(getAllPlayers(), "Code: TXCXX", "twitter.com/Seita_ow", "Full details: workshop.codes/1v1arena", HudPosition.TOP, 22, Color.ORANGE, Color.BLUE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    IntroHud = getLastCreatedText()


rule "Pause Timer":
    @Condition isGameInProgress() == true

    pauseMatchTime()
    setMatchTime(1220)
    wait(1)
    destroyHudText(IntroHud)


rule "Restart Hero List":
    @Event eachPlayer
    @Condition eventPlayer.HeroNumber == len(eventPlayer.HeroList)

    eventPlayer.HeroNumber = 0


rule "Main Arena Locations":
    MainCenter = vect(0, 267, 280)
    MainHigh = vect(0, 280, 280)
    MainTopDeck = vect(0, 279.5, 295.5)
    MainFacing = vect(0, 268.5, 280)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.RED, MainCenter, 16.7, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, MainTopDeck, 2.61, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    SpecSpot = vect(13.366, 285, 279.711)
    SpecSpot2 = vect(-13.672, 285, 279.735)


rule "Main Arena Spawn Locations":
    MainDefaultSpawn = vect(-0.087, 268, 267.986)
    #MainOppositeSpawn = vect(11.146, 268, 275.313)
    MainOppositeSpawn = vect(11, 268, 276.2)
    MainOppositeSpawn.append(vect(-11, 268, 276.2))
    MainTopSpawn = vect(7.923, 268, 273.866)
    MainTopSpawn.append(vect(0.004, 268, 276.965))
    MainTopSpawn.append(vect(-7.771, 268, 273.383))
    #MainDeckSpawn = vect(9.421, 268, 280.176)
    MainDeckSpawn = vect(9.486, 268, 280.02)
    MainDeckSpawn.append(vect(-0.005, 268, 283.035))
    MainDeckSpawn.append(vect(-9.486, 268, 280.02))


rule "Main Arena Spawn Location Detection Spots":
    MainSpawnDetLoc[0] = vect(0.198, 271.351, 302.477)
    MainSpawnDetLoc[1] = vect(0.147, 271.348, 266.101)
    MainSpawnDetLoc[2] = vect(20.349, 268.349, 281.046)
    MainSpawnDetLoc[3] = vect(-20.35, 268.349, 281.009)


rule "Arena 2: Zone.0, SafeCheck.1, Spawn.0&1, Facing.2":
    SideArenaCenter = vect(-41.832, 260, 344.857)
    SideArenaCenter.append(vect(-41.832, 270, 344.857))
    SideArenaSpawnsFacing = vect(-50.464, 268.667, 351.671)
    SideArenaSpawnsFacing.append(vect(-31.82, 268.549, 332.737))
    SideArenaSpawnsFacing.append(vect(-38.715, 271.502, 343.17))
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.RED, SideArenaCenter[0], 18, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Arena 3: Zone.2, SafeCheck.3, Spawn.3&4, Facing.5":
    SideArenaCenter.append(vect(41.832, 260, 344.857))
    SideArenaCenter.append(vect(41.832, 270, 344.857))
    SideArenaSpawnsFacing.append(vect(50.464, 268.667, 351.671))
    SideArenaSpawnsFacing.append(vect(31.82, 268.549, 332.737))
    SideArenaSpawnsFacing.append(vect(38.715, 271.502, 343.17))
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, SideArenaCenter[2], 18, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Player Joins host player different heroes --------------------------------------------------------------------------------------":
    @Event playerJoined
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer == hostPlayer
    @Condition HostHasDifferentheroes == true

    eventPlayer.HeroList = random.shuffle(HeroList2)
    eventPlayer.startForcingHero(eventPlayer.HeroList[eventPlayer.HeroNumber])
    if len(eventPlayer.HeroList) == 1:
        eventPlayer.OneHeroPlayerVariable = true
        eventPlayer.HeroList.append(eventPlayer.HeroList[0])
    if isGameInProgress():
        goto lbl_0
    Arena1Q.append(eventPlayer)
    goto lbl_1
    lbl_0:
    if getNumberOfPlayers(Team.ALL) > 3:
        goto lbl_2
    Arena1Q.append(eventPlayer)
    goto lbl_3
    lbl_2:
    if getNumberOfPlayers(Team.ALL) != 4:
        goto lbl_4
    Arena2Q.append(eventPlayer)
    goto lbl_5
    lbl_4:
    if getNumberOfPlayers(Team.ALL) != 5:
        goto lbl_6
    Arena2Q.append(eventPlayer)
    goto lbl_7
    lbl_6:
    if getNumberOfPlayers(Team.ALL) < 6:
        goto lbl_8
    Arena3Q.append(eventPlayer)
    lbl_1:
    lbl_3:
    lbl_5:
    lbl_7:
    lbl_8:
    eventPlayer.Spectating = true
    if not eventPlayer in Arena1Q:
        goto lbl_9
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena1Q.index(eventPlayer) - 2)), "Score per kill: 3", "Arena: 1", HudPosition.TOP, 2, Color.GREEN, Color.WHITE, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_9:
    if not eventPlayer in Arena2Q:
        goto lbl_10
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena2Q.index(eventPlayer) - 2)), "Score per kill: 2", "Arena: 2", HudPosition.TOP, 2, Color.RED, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_10:
    if not eventPlayer in Arena3Q:
        goto lbl_11
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena3Q.index(eventPlayer) - 2)), "Score per kill: 1", "Arena: 3", HudPosition.TOP, 2, Color.BLUE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_11:
    wait(0.3)
    if eventPlayer.Spectating == false:
        goto lbl_12
    eventPlayer.JoinSpecHelper = true
    lbl_12:


rule "Player Joins not host player different heroes ----------------------------------------":
    @Event playerJoined
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer != hostPlayer
    @Condition HostHasDifferentheroes == true

    eventPlayer.HeroList = random.shuffle(HeroList)
    eventPlayer.startForcingHero(eventPlayer.HeroList[eventPlayer.HeroNumber])
    if len(eventPlayer.HeroList) == 1:
        eventPlayer.OneHeroPlayerVariable = true
        eventPlayer.HeroList.append(eventPlayer.HeroList[0])
    if isGameInProgress():
        goto lbl_0
    Arena1Q.append(eventPlayer)
    goto lbl_1
    lbl_0:
    if getNumberOfPlayers(Team.ALL) > 3:
        goto lbl_2
    Arena1Q.append(eventPlayer)
    goto lbl_3
    lbl_2:
    if getNumberOfPlayers(Team.ALL) != 4:
        goto lbl_4
    Arena2Q.append(eventPlayer)
    goto lbl_5
    lbl_4:
    if getNumberOfPlayers(Team.ALL) != 5:
        goto lbl_6
    Arena2Q.append(eventPlayer)
    goto lbl_7
    lbl_6:
    if getNumberOfPlayers(Team.ALL) < 6:
        goto lbl_8
    Arena3Q.append(eventPlayer)
    lbl_1:
    lbl_3:
    lbl_5:
    lbl_7:
    lbl_8:
    eventPlayer.Spectating = true
    if not eventPlayer in Arena1Q:
        goto lbl_9
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena1Q.index(eventPlayer) - 2)), "Score per kill: 3", "Arena: 1", HudPosition.TOP, 2, Color.GREEN, Color.WHITE, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_9:
    if not eventPlayer in Arena2Q:
        goto lbl_10
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena2Q.index(eventPlayer) - 2)), "Score per kill: 2", "Arena: 2", HudPosition.TOP, 2, Color.RED, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_10:
    if not eventPlayer in Arena3Q:
        goto lbl_11
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena3Q.index(eventPlayer) - 2)), "Score per kill: 1", "Arena: 3", HudPosition.TOP, 2, Color.BLUE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_11:
    wait(0.3)
    if eventPlayer.Spectating == false:
        goto lbl_12
    eventPlayer.JoinSpecHelper = true
    lbl_12:


rule "Player Joins":
    @Event playerJoined
    @Condition eventPlayer.isDummy() == false
    @Condition HostHasDifferentheroes == false

    eventPlayer.HeroList = random.shuffle(HeroList)
    eventPlayer.startForcingHero(eventPlayer.HeroList[eventPlayer.HeroNumber])
    if len(eventPlayer.HeroList) == 1:
        eventPlayer.OneHeroPlayerVariable = true
        eventPlayer.HeroList.append(eventPlayer.HeroList[0])
    if isGameInProgress():
        goto lbl_0
    Arena1Q.append(eventPlayer)
    goto lbl_1
    lbl_0:
    if getNumberOfPlayers(Team.ALL) > 3:
        goto lbl_2
    Arena1Q.append(eventPlayer)
    goto lbl_3
    lbl_2:
    if getNumberOfPlayers(Team.ALL) != 4:
        goto lbl_4
    Arena2Q.append(eventPlayer)
    goto lbl_5
    lbl_4:
    if getNumberOfPlayers(Team.ALL) != 5:
        goto lbl_6
    Arena2Q.append(eventPlayer)
    goto lbl_7
    lbl_6:
    if getNumberOfPlayers(Team.ALL) < 6:
        goto lbl_8
    Arena3Q.append(eventPlayer)
    lbl_1:
    lbl_3:
    lbl_5:
    lbl_7:
    lbl_8:
    eventPlayer.Spectating = true
    if not eventPlayer in Arena1Q:
        goto lbl_9
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena1Q.index(eventPlayer) - 2)), "Score per kill: 3", "Arena: 1", HudPosition.TOP, 2, Color.GREEN, Color.WHITE, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_9:
    if not eventPlayer in Arena2Q:
        goto lbl_10
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena2Q.index(eventPlayer) - 2)), "Score per kill: 2", "Arena: 2", HudPosition.TOP, 2, Color.RED, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_10:
    if not eventPlayer in Arena3Q:
        goto lbl_11
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena3Q.index(eventPlayer) - 2)), "Score per kill: 1", "Arena: 3", HudPosition.TOP, 2, Color.BLUE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_11:
    wait(0.3)
    if eventPlayer.Spectating == false:
        goto lbl_12
    eventPlayer.JoinSpecHelper = true
    lbl_12:


rule "Joins, First Spec helper":
    @Event eachPlayer
    @Condition eventPlayer.JoinSpecHelper == true

    eventPlayer.teleport(SpecSpot)
    eventPlayer.startForcingThrottle(0, 0, 0, 0, 0, 0)
    eventPlayer.setGravity(abs(0))
    eventPlayer.setMoveSpeed(abs(0))
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setStatusEffect(null, Status.ROOTED, 9999)
    eventPlayer.setDamageDealt(0)
    wait(0.5)
    if eventPlayer.Spectating == false:
        goto lbl_0
    eventPlayer.setFacing(localVector(MainFacing, eventPlayer, Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    lbl_0:


rule "Spread everyone once the game is in Progress":
    @Condition isGameInProgress() == true

    if getNumberOfPlayers(Team.ALL) != 4:
        goto lbl_0
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_0:
    if getNumberOfPlayers(Team.ALL) != 5:
        goto lbl_1
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena2Q.append(Arena1Q[5])
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_1:
    if getNumberOfPlayers(Team.ALL) != 6:
        goto lbl_2
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_2:
    if getNumberOfPlayers(Team.ALL) != 7:
        goto lbl_3
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    Arena3Q.append(Arena1Q[7])
    del Arena1Q[7]
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_3:
    if getNumberOfPlayers(Team.ALL) != 8:
        goto lbl_4
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    Arena3Q.append(Arena1Q[7])
    Arena3Q.append(Arena1Q[8])
    del Arena1Q[8]
    del Arena1Q[7]
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_4:
    if getNumberOfPlayers(Team.ALL) != 9:
        goto lbl_5
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    Arena3Q.append(Arena1Q[7])
    Arena3Q.append(Arena1Q[8])
    Arena3Q.append(Arena1Q[9])
    del Arena1Q[9]
    del Arena1Q[8]
    del Arena1Q[7]
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_5:
    if getNumberOfPlayers(Team.ALL) != 10:
        goto lbl_6
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    Arena3Q.append(Arena1Q[7])
    Arena3Q.append(Arena1Q[8])
    Arena3Q.append(Arena1Q[9])
    Arena3Q.append(Arena1Q[10])
    del Arena1Q[10]
    del Arena1Q[9]
    del Arena1Q[8]
    del Arena1Q[7]
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_6:
    if getNumberOfPlayers(Team.ALL) != 11:
        goto lbl_7
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    Arena3Q.append(Arena1Q[7])
    Arena3Q.append(Arena1Q[8])
    Arena3Q.append(Arena1Q[9])
    Arena3Q.append(Arena1Q[10])
    Arena3Q.append(Arena1Q[11])
    del Arena1Q[11]
    del Arena1Q[10]
    del Arena1Q[9]
    del Arena1Q[8]
    del Arena1Q[7]
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    return
    lbl_7:
    if getNumberOfPlayers(Team.ALL) != 12:
        goto lbl_8
    Arena2Q.append(Arena1Q[3])
    Arena2Q.append(Arena1Q[4])
    Arena3Q.append(Arena1Q[5])
    Arena3Q.append(Arena1Q[6])
    Arena3Q.append(Arena1Q[7])
    Arena3Q.append(Arena1Q[8])
    Arena3Q.append(Arena1Q[9])
    Arena3Q.append(Arena1Q[10])
    Arena3Q.append(Arena1Q[11])
    Arena3Q.append(Arena1Q[12])
    del Arena1Q[12]
    del Arena1Q[11]
    del Arena1Q[10]
    del Arena1Q[9]
    del Arena1Q[8]
    del Arena1Q[7]
    del Arena1Q[6]
    del Arena1Q[5]
    del Arena1Q[4]
    del Arena1Q[3]
    lbl_8:


rule "Player playing in Arena 1 Leaves - (wait?)":
    @Event playerLeft
    @Condition (eventPlayer == Arena1Q[1] or eventPlayer == Arena1Q[2]) == true
    @Condition Arena1Match == true

    Arena1Q.remove(eventPlayer)
    heal(Arena1Q[1], null, 1000)
    #wait(1)
    Arena1Match = false


rule "Player playing in Arena 2 Leaves - (wait?)":
    @Event playerLeft
    @Condition (eventPlayer == Arena2Q[1] or eventPlayer == Arena2Q[2]) == true
    @Condition Arena2Match == true

    Arena2Q.remove(eventPlayer)
    heal(Arena2Q[1], null, 1000)
    Arena2Q[1].Spectating = true
    #wait(1)
    Arena2Match = false


rule "Player playing in Arena 3 Leaves - (wait?)":
    @Event playerLeft
    @Condition (eventPlayer == Arena3Q[1] or eventPlayer == Arena1Q[2]) == true
    @Condition Arena3Match == true

    Arena3Q.remove(eventPlayer)
    heal(Arena3Q[1], null, 1000)
    Arena3Q[1].Spectating = true
    #wait(1)
    Arena3Match = false


rule "Player Leaves, Remove from All Queues":
    @Event playerLeft

    Arena1Q.remove(eventPlayer)
    Arena2Q.remove(eventPlayer)
    Arena3Q.remove(eventPlayer)


rule "Player leaves: 4 -> 3 players: Sort the Queue":
    @Event playerLeft
    @Condition len(getAllPlayers()) == 3

    del Arena2Q[0]
    if Arena2Q == false:
        goto lbl_0
    Arena1Q.append(Arena2Q)
    lbl_0:
    Arena2Q = 0
    Arena2Match = false
    Arena1Q[3].Spectating = true


rule "Player leaves: 6 -> 5 players: Sort the Queue":
    @Event playerLeft
    @Condition len(getAllPlayers()) == 5

    del Arena3Q[0]
    if Arena3Q == false:
        goto lbl_0
    Arena2Q.append(Arena3Q)
    lbl_0:
    Arena3Q = 0
    Arena3Match = false
    Arena2Q[3].Spectating = true
    Arena2Q[4].Spectating = true
    Arena2Q[5].Spectating = true


/*
rule "Bugfix":
*/

rule "Arena 1 bug fix":
    @Event eachPlayer
    @Condition (eventPlayer == Arena1Q[1] or eventPlayer == Arena1Q[2]) == true
    #@Condition eventPlayer == Arena1Q[2]
    @Condition eventPlayer.Spectating == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition isGameInProgress() == true
    @Condition FirstMatch == true

    wait(1.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.Spectating = false


rule "Arena 2 bug fix":
    @Condition Arena2Q[1] == true
    @Condition Arena2Q[2] == true
    @Condition Arena2Match == true

    wait(30, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), "Duel taking over 30s in Arena2 or bugged, killing 1 player to keep the queue rolling")
    kill(Arena2Q[2], Arena2Q[1])
    wait(3, Wait.ABORT_WHEN_FALSE)
    kill(Arena2Q[1], Arena2Q[2])


rule "Arena 3 bug fix":
    @Condition Arena3Q[1] == true
    @Condition Arena3Q[2] == true
    @Condition Arena3Match == true

    wait(30, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), "Duel taking over 30s in Arena3 or bugged, killing 1 player to keep the queue rolling")
    kill(Arena3Q[2], Arena3Q[1])
    wait(3, Wait.ABORT_WHEN_FALSE)
    kill(Arena3Q[1], Arena3Q[2])


/*
rule "Match and Round Start":
*/

rule "Arena1 First Match Start":
    @Condition isGameInProgress() == true
    @Condition Arena1Q[1] == true
    @Condition Arena1Q[2] == true
    @Condition Arena1Q[1].hasSpawned() == true
    @Condition Arena1Q[2].hasSpawned() == true
    @Condition Arena1Match == false
    @Condition FirstMatch == false

    Arena1Match = true
    wait(0.25)
    Arena1Q[1].teleport(MainOppositeSpawn[0])
    Arena1Q[2].teleport(MainOppositeSpawn[1])
    wait(0.05)
    Arena1Q[1].setFacing(localVector(MainFacing, Arena1Q[1], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    Arena1Q[2].setFacing(localVector(MainFacing, Arena1Q[2], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    wait(0.05)
    Arena1Q[1].Spectating = 0
    Arena1Q[2].Spectating = 0
    wait(0.3)
    heal(Arena1Q[1], null, 1000)
    heal(Arena1Q[2], null, 1000)
    Arena1Q[1].DeadHelper = false
    Arena1Q[2].DeadHelper = false
    FirstMatch = true


rule "Arena1 Match Start":
    @Condition Arena1Q[1] == true
    @Condition Arena1Q[2] == true
    @Condition Arena1Match == false
    @Condition FirstMatch == true

    SpawnLocationCheck()
    wait(0.1)
    Arena1Q[2].teleport(MainDefaultSpawn)
    wait(0.05)
    Arena1Q[2].setFacing(localVector(MainFacing, Arena1Q[2], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    wait(0.05)
    Arena1Q[1].Spectating = false
    Arena1Q[2].Spectating = false
    wait(0.1)
    heal(Arena1Q[1], null, 1000)
    heal(Arena1Q[2], null, 1000)
    Arena1Q[1].DeadHelper = false
    Arena1Q[2].DeadHelper = false
    Arena1Match = true
    if RULE_CONDITION:
        goto RULE_START


rule "Arena2 Match Start":
    @Condition Arena2Q[1] == true
    @Condition Arena2Q[2] == true
    @Condition Arena2Match == false

    wait()
    Arena2Match = true
    wait(0.5)
    Arena2Q[1].teleport(SideArenaSpawnsFacing[0])
    Arena2Q[2].teleport(SideArenaSpawnsFacing[1])
    wait(0.05)
    Arena2Q[1].setFacing(localVector(SideArenaSpawnsFacing[2], Arena2Q[1], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    Arena2Q[2].setFacing(localVector(SideArenaSpawnsFacing[2], Arena2Q[2], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    wait(0.05)
    Arena2Q[1].Spectating = false
    Arena2Q[2].Spectating = false
    Arena2Q[1].DeadHelper = false
    Arena2Q[2].DeadHelper = false
    wait(0.3)
    heal(Arena2Q[1], null, 1000)
    heal(Arena2Q[2], null, 1000)
    if RULE_CONDITION:
        goto RULE_START


rule "Arena3 Match Start":
    @Condition Arena3Q[1] == true
    @Condition Arena3Q[2] == true
    @Condition Arena3Match == false

    wait()
    Arena3Match = true
    wait(0.5)
    Arena3Q[1].teleport(SideArenaSpawnsFacing[3])
    Arena3Q[2].teleport(SideArenaSpawnsFacing[4])
    wait(0.05)
    Arena3Q[1].setFacing(localVector(SideArenaSpawnsFacing[5], Arena3Q[1], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    Arena3Q[2].setFacing(localVector(SideArenaSpawnsFacing[5], Arena3Q[2], Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    wait(0.05)
    Arena3Q[1].Spectating = false
    Arena3Q[2].Spectating = false
    Arena3Q[1].DeadHelper = false
    Arena3Q[2].DeadHelper = false
    wait(0.3)
    heal(Arena3Q[1], null, 1000)
    heal(Arena3Q[2], null, 1000)
    if RULE_CONDITION:
        goto RULE_START


def SpawnLocationCheck():
    @Name "SUB: Spawn location check"

    if distance(Arena1Q[1].getEyePosition(), MainSpawnDetLoc[2]) <= 19:
        MainDefaultSpawn = MainOppositeSpawn[1]
        #smallMessage(getAllPlayers(), "Attacker is Right")
    elif distance(Arena1Q[1].getEyePosition(), MainSpawnDetLoc[3]) <= 19:
        MainDefaultSpawn = MainOppositeSpawn[0]
        #smallMessage(getAllPlayers(), "Attacker is Left")
    elif distance(Arena1Q[1].getEyePosition(), MainSpawnDetLoc[0]) <= 15:
        MainDefaultSpawn = random.choice(MainTopSpawn)
        #smallMessage(getAllPlayers(), "Attacker is stairs / top")
    elif distance(Arena1Q[1].getEyePosition(), MainSpawnDetLoc[1]) <= 10:
        #smallMessage(getAllPlayers(), "Attacker is deck side")
        MainDefaultSpawn = random.choice(MainDeckSpawn)
    else:
        MainDefaultSpawn = random.choice(MainOppositeSpawn)
        #smallMessage(getAllPlayers(), "None / Mid / default spawn")


/*
rule "Spectating":
*/

rule "Player Dies, Set Spectating and Change Hero ---------------------------------------------täs on onehero---------------------":
    @Event playerDied
    @Condition isGameInProgress() == true

    eventPlayer.Spectating = true
    eventPlayer.UltCharge = eventPlayer.getUltCharge()
    eventPlayer.HeroNumber += 1
    wait(0.25)
    if eventPlayer.OneHeroPlayerVariable == false:
        goto lbl_0
    eventPlayer.startForcingHero(Hero.SYMMETRA)
    lbl_0:
    eventPlayer.startForcingHero(eventPlayer.HeroList[eventPlayer.HeroNumber])
    wait(0.15)
    eventPlayer.setUltCharge(eventPlayer.UltCharge)


rule "Spectating":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == true

    eventPlayer.teleport(SpecSpot)
    eventPlayer.startForcingThrottle(0, 0, 0, 0, 0, 0)
    eventPlayer.setGravity(abs(0))
    eventPlayer.setMoveSpeed(abs(0))
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    eventPlayer.stopForcingButton(Button.ABILITY_1)
    eventPlayer.stopForcingButton(Button.ABILITY_2)
    eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setStatusEffect(null, Status.ROOTED, 9999)
    eventPlayer.setDamageDealt(0)
    wait(0.5)
    if eventPlayer.Spectating == false:
        goto lbl_0
    eventPlayer.setFacing(localVector(MainFacing, eventPlayer, Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    lbl_0:


rule "Spectating: You are next message & Sound":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == true
    @Condition (Arena1Q[3] == eventPlayer or Arena2Q[3] == eventPlayer or Arena3Q[3] == eventPlayer) == true

    bigMessage(eventPlayer, "you are next")
    playEffect(eventPlayer, DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 200)


rule "Not Spectating: Allow buttons":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == false

    eventPlayer.setGravity(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 0)
    eventPlayer.setInvisibility(Invis.NONE)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 0)
    eventPlayer.setStatusEffect(null, Status.ROOTED, 0)
    eventPlayer.setDamageDealt(100)
    eventPlayer.stopForcingThrottle()
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    if eventPlayer.getCurrentHero() == Hero.TRACER:
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, 3.5)


/*
rule "Player Dies":
*/

def Arena1Dies():
    @Name "SUB: Arena 1 Player dies - Arena1Q[1] = Winner ----------täs onehero meniks que number oikei"

    Arena1Q[1].setAmmo(0, Arena1Q[1].getMaxAmmo(0))
    heal(Arena1Q[1], null, 1000)
    Arena1Q[1].Score += 3
    Arena1Q[1].setScore(Arena1Q[1].Score)
    eventPlayer.clearStatusEffect(Status.BURNING)
    Arena1Q[1].clearStatusEffect(Status.BURNING)
    Arena1Match = false
    #always refresh testing
    if AlwaysRefreshHero == true:
        goto lbl_0
    if Arena1Q[1].AntiHealDebuffed == true:
        goto lbl_1
    if Arena1Q[1].getCurrentHero() != Hero.DOOMFIST:
        goto lbl_2
    wait(0.5)
    damage(Arena1Q[1], null, Arena1Q[1].getHealth() - 250)
    lbl_1:
    lbl_2:
    if Arena1Q[1].OneHeroPlayerVariable == true:
        goto lbl_3
    if Arena1Q[1].AntiHealDebuffed != true:
        goto lbl_4
    lbl_0:
    lbl_3:
    Arena1Q[1].UltCharge = Arena1Q[1].getUltCharge()
    Arena1Q[1].startForcingHero(Hero.SYMMETRA)
    wait(0.2)
    Arena1Q[1].startForcingHero(Arena1Q[1].HeroList[Arena1Q[1].HeroNumber])
    wait(0.05)
    Arena1Q[1].setUltCharge(Arena1Q[1].UltCharge)
    lbl_4:


def Arena2Dies():
    @Name "SUB: Arena 2 Player dies - Arena2Q[1] = Winner"

    heal(Arena2Q[1], null, 1000)
    Arena2Q[1].UltCharge = Arena2Q[1].getUltCharge()
    Arena2Q[1].startForcingHero(Hero.SYMMETRA)
    wait(0.2)
    Arena2Q[1].startForcingHero(Arena2Q[1].HeroList[Arena2Q[1].HeroNumber])
    wait(0.05)
    Arena2Q[1].setUltCharge(Arena2Q[1].UltCharge)
    if Arena2Q[1] == false:
        goto lbl_0
    Arena1Q.append(Arena2Q[1])
    lbl_0:
    Arena2Q[1].Spectating = true
    heal(Arena2Q[1], null, 1000)
    if Arena2Q[1].Score >= 48:
        goto lbl_1
    Arena2Q[1].Score += 2
    lbl_1:
    Arena2Q[1].setScore(Arena2Q[1].Score)
    Arena2Q[1].clearStatusEffect(Status.BURNING)
    if Arena2Q[1] == false:
        goto lbl_2
    del Arena2Q[1]
    lbl_2:
    eventPlayer.clearStatusEffect(Status.BURNING)
    Arena2Match = false


def Arena3Dies():
    @Name "SUB: Arena 3 Player dies - Arena3Q[1] = Winner (toimiiks tää skip if 5)"

    heal(Arena3Q[1], null, 300)
    Arena3Q[1].UltCharge = Arena3Q[1].getUltCharge()
    Arena3Q[1].startForcingHero(Hero.SYMMETRA)
    wait(0.2)
    Arena3Q[1].startForcingHero(Arena3Q[1].HeroList[Arena3Q[1].HeroNumber])
    wait(0.05)
    Arena3Q[1].setUltCharge(Arena3Q[1].UltCharge)
    if Arena3Q[1] == false:
        goto lbl_0
    if len(getAllPlayers()) <= 3:
        Arena1Q.append(Arena3Q[1])
    else:
        Arena2Q.append(Arena3Q[1])
    lbl_0:
    Arena3Q[1].Spectating = true
    if Arena3Q[1].Score == 49:
        goto lbl_1
    Arena3Q[1].Score += 1
    lbl_1:
    Arena3Q[1].setScore(Arena3Q[1].Score)
    heal(Arena3Q[1], null, 300)
    Arena3Q[1].clearStatusEffect(Status.BURNING)
    if Arena3Q[1] == false:
        goto lbl_2
    del Arena3Q[1]
    lbl_2:
    eventPlayer.clearStatusEffect(Status.BURNING)
    Arena3Match = false


rule "Arena 1: Player Dies, 1-3 Players":
    @Event playerDied
    @Condition len(getAllPlayers()) < 4
    @Condition (eventPlayer == Arena1Q[1] or eventPlayer == Arena1Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena1Q.remove(eventPlayer)
    Arena1Q.append(eventPlayer)
    Arena1Dies()


rule "Arena 1: Player Dies, 4-X Players":
    @Event playerDied
    @Condition len(getAllPlayers()) >= 4
    @Condition (eventPlayer == Arena1Q[1] or eventPlayer == Arena1Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena1Q.remove(eventPlayer)
    Arena2Q.append(eventPlayer)
    Arena1Dies()


rule "Arena 2: Player Dies, 1-3 Players (vääräs järkäs menee Q)":
    @Event playerDied
    @Condition len(getAllPlayers()) < 4
    @Condition (eventPlayer == Arena2Q[1] or eventPlayer == Arena2Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena2Q.remove(eventPlayer)
    Arena1Q.append(eventPlayer)
    Arena2Dies()


rule "Arena 2: Player Dies, 4-5 Players":
    @Event playerDied
    @Condition len(getAllPlayers()) < 6
    @Condition len(getAllPlayers()) > 3
    @Condition (eventPlayer == Arena2Q[1] or eventPlayer == Arena2Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena2Q.remove(eventPlayer)
    Arena2Q.append(eventPlayer)
    Arena2Dies()


rule "Arena 2: Player Dies, 6-12 Players":
    @Event playerDied
    @Condition len(getAllPlayers()) > 5
    @Condition (eventPlayer == Arena2Q[1] or eventPlayer == Arena2Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena2Q.remove(eventPlayer)
    Arena3Q.append(eventPlayer)
    Arena2Dies()


rule "Arena 3: Player Dies, 1-3 Players (vääräs järkäs menee Q)":
    @Event playerDied
    @Condition len(getAllPlayers()) < 4
    @Condition (eventPlayer == Arena3Q[1] or eventPlayer == Arena3Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena3Q.remove(eventPlayer)
    Arena1Q.append(eventPlayer)
    Arena3Dies()


rule "Arena 3: Player Dies, 4-5 Players (vääräs järkäs menee Q)":
    @Event playerDied
    @Condition len(getAllPlayers()) < 6
    @Condition len(getAllPlayers()) > 3
    @Condition (eventPlayer == Arena3Q[1] or eventPlayer == Arena3Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena3Q.remove(eventPlayer)
    Arena2Q.append(eventPlayer)
    Arena3Dies()


rule "Arena 3: Player Dies, 6-12 Players":
    @Event playerDied
    @Condition len(getAllPlayers()) > 5
    @Condition (eventPlayer == Arena3Q[1] or eventPlayer == Arena3Q[2]) == true
    @Condition eventPlayer.DeadHelper == false

    eventPlayer.DeadHelper = true
    Arena3Q.remove(eventPlayer)
    Arena3Q.append(eventPlayer)
    Arena3Dies()


rule "Player attributes":


rule "Refreshing Hero if player was under anti heal after winning":
    @Event playerTookDamage
    @Condition (attacker.getCurrentHero() == Hero.ANA and (eventDamage == 60 or eventDamage == 90)) == true
    @Condition eventPlayer.Spectating == false
    @Condition eventPlayer in Arena1Q == true

    eventPlayer.AntiHealDebuffed = true
    wait(4)
    eventPlayer.AntiHealDebuffed = false


rule "Queue Hud Arena 1":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == true
    @Condition eventPlayer in Arena1Q == true
    @Condition isGameInProgress() == true

    destroyHudText(eventPlayer.Hud)
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena1Q.index(eventPlayer) - 2)), "Score per kill: 3", "Arena: 1", HudPosition.TOP, 2, Color.GREEN, Color.WHITE, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()


rule "Queue Hud Arena 2":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == true
    @Condition eventPlayer in Arena2Q == true
    @Condition isGameInProgress() == true

    destroyHudText(eventPlayer.Hud)
    if eventPlayer.Score >= 48:
        goto lbl_0
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena2Q.index(eventPlayer) - 2)), "Score per kill: 2", "Arena: 2", HudPosition.TOP, 2, Color.RED, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    lbl_0:
    if eventPlayer.Score < 48:
        goto lbl_1
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena2Q.index(eventPlayer) - 2)), "To win you need to get a kill in Arena 1", "Arena: 2", HudPosition.TOP, 2, Color.RED, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    lbl_1:
    eventPlayer.Hud = getLastCreatedText()


rule "Queue Hud Arena 3":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == true
    @Condition eventPlayer in Arena3Q == true
    @Condition isGameInProgress() == true

    destroyHudText(eventPlayer.Hud)
    if eventPlayer.Score == 49:
        goto lbl_0
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena3Q.index(eventPlayer) - 2)), "Score per kill: 1", "Arena: 3", HudPosition.TOP, 2, Color.BLUE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    lbl_0:
    if eventPlayer.Score != 49:
        goto lbl_1
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena3Q.index(eventPlayer) - 2)), "To win you need to get a kill in Arena 1", "Arena: 3", HudPosition.TOP, 2, Color.BLUE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    lbl_1:
    eventPlayer.Hud = getLastCreatedText()


rule "Destory Queue Hud when not Spectating":
    @Event eachPlayer
    @Condition eventPlayer.Spectating == false
    @Condition isGameInProgress() == true

    destroyHudText(eventPlayer.Hud)


rule "Arena is decided by death of one player":


rule "Safe Zone Check Arena 1 Center":
    @Event eachPlayer
    @Condition distance(eventPlayer, MainHigh) >= 16.4
    @Condition distance(eventPlayer, MainCenter) >= 15.1
    @Condition (Arena1Q[1] == eventPlayer or Arena1Q[2] == eventPlayer) == true
    @Condition (eventPlayer.getAltitude() >= 30 or eventPlayer.getAltitude() <= 6) == true
    @Condition eventPlayer.Spectating == false

    eventPlayer.setStatusEffect(null, Status.BURNING, 0.5)
    damage(eventPlayer, null, BurnDamage)
    wait(0.5)
    if RULE_CONDITION:
        goto RULE_START


rule "Safe Zone Check Arena 1 Top":
    @Event eachPlayer
    @Condition distance(eventPlayer, MainTopDeck) <= 3.75
    @Condition eventPlayer.Spectating == false
    @Condition (Arena1Q[1] == eventPlayer or Arena1Q[2] == eventPlayer) == true
    @Condition (eventPlayer.getAltitude() >= 30 or eventPlayer.getAltitude() <= 6) == true

    eventPlayer.setStatusEffect(null, Status.BURNING, 0.5)
    damage(eventPlayer, null, BurnDamage)
    wait(0.5)
    if RULE_CONDITION:
        goto RULE_START


rule "Safe Zone Check Arena 2":
    @Event eachPlayer
    @Condition distance(eventPlayer, SideArenaCenter[1]) >= 17.4
    @Condition (Arena2Q[1] == eventPlayer or Arena2Q[2] == eventPlayer) == true
    @Condition eventPlayer.Spectating == false
    @Condition Arena2Match == true
    @Condition (eventPlayer.getAltitude() >= 30 or eventPlayer.getAltitude() <= 6) == true

    eventPlayer.setStatusEffect(null, Status.BURNING, 0.5)
    damage(eventPlayer, null, BurnDamage)
    wait(0.5)
    if RULE_CONDITION:
        goto RULE_START


rule "Safe Zone Check Arena 3":
    @Event eachPlayer
    @Condition distance(eventPlayer, SideArenaCenter[3]) >= 17.4
    @Condition eventPlayer.Spectating == false
    @Condition (Arena3Q[1] == eventPlayer or Arena3Q[2] == eventPlayer) == true
    @Condition Arena3Match == true
    @Condition (eventPlayer.getAltitude() >= 30 or eventPlayer.getAltitude() <= 6) == true

    eventPlayer.setStatusEffect(null, Status.BURNING, 0.5)
    damage(eventPlayer, null, BurnDamage)
    wait(0.5)
    if RULE_CONDITION:
        goto RULE_START


/*
rule "Bot game:":
*/

rule "Add bot":
    @Condition isGameInProgress() == true
    @Condition getNumberOfPlayers(Team.ALL) == 1

    smallMessage(getAllPlayers(), "Player alone: Spawning a bot in 3 seconds")
    wait(3, Wait.ABORT_WHEN_FALSE)
    createDummy(Hero.GENJI, Team.ALL, 11, vect(-9.438, 268.417, 278.042), directionTowards(vect(-0.133, 279.5, 291.308), vect(0.027, 274, 279.863)))
    getAllPlayers().Score = 0
    getAllPlayers().setScore(0)


rule "Player Joins (bot)":
    @Event playerJoined
    @Condition eventPlayer.isDummy() == true

    eventPlayer.HeroList = Hero.GENJI
    eventPlayer.HeroList.append(Hero.BAPTISTE)
    eventPlayer.HeroList.append(Hero.HANZO)
    eventPlayer.HeroList.append(Hero.ZENYATTA)
    eventPlayer.startForcingHero(eventPlayer.HeroList[eventPlayer.HeroNumber])
    if isGameInProgress():
        goto lbl_0
    Arena1Q.append(eventPlayer)
    goto lbl_1
    lbl_0:
    if getNumberOfPlayers(Team.ALL) > 3:
        goto lbl_2
    Arena1Q.append(eventPlayer)
    goto lbl_3
    lbl_2:
    if getNumberOfPlayers(Team.ALL) != 4:
        goto lbl_4
    Arena2Q.append(eventPlayer)
    goto lbl_5
    lbl_4:
    if getNumberOfPlayers(Team.ALL) != 5:
        goto lbl_6
    Arena2Q.append(eventPlayer)
    goto lbl_7
    lbl_6:
    if getNumberOfPlayers(Team.ALL) < 6:
        goto lbl_8
    Arena3Q.append(eventPlayer)
    lbl_1:
    lbl_3:
    lbl_5:
    lbl_7:
    lbl_8:
    eventPlayer.Spectating = true
    if not eventPlayer in Arena1Q:
        goto lbl_9
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena1Q.index(eventPlayer) - 2)), "Score per kill: 3", "Arena: 1", HudPosition.TOP, 2, Color.GREEN, Color.WHITE, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_9:
    if not eventPlayer in Arena2Q:
        goto lbl_10
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena2Q.index(eventPlayer) - 2)), "Score per kill: 2", "Arena: 2", HudPosition.TOP, 2, Color.RED, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_10:
    if not eventPlayer in Arena3Q:
        goto lbl_11
    hudText(eventPlayer, l"{0}: {1}".format("Position in Queue", abs(Arena3Q.index(eventPlayer) - 2)), "Score per kill: 1", "Arena: 3", HudPosition.TOP, 2, Color.BLUE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.Hud = getLastCreatedText()
    lbl_11:
    wait(0.3)
    if eventPlayer.Spectating == false:
        goto lbl_12
    eventPlayer.JoinSpecHelper = true
    lbl_12:


rule "Remove bot":
    @Condition isGameInProgress() == true
    @Condition getNumberOfPlayers(Team.ALL) >= 3
    @Condition getPlayersInSlot(11, Team.ALL).isDummy() == true

    smallMessage(getAllPlayers(), "Player joined: reseting score and removing the bot in 3 seconds")
    wait(3, Wait.ABORT_WHEN_FALSE)
    destroyAllDummies()
    getAllPlayers().Score = 0
    getAllPlayers().setScore(0)


rule "TargetNumber 1":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer != Arena1Q[1]

    Roadhog2 = 1


rule "TargetNumber 2":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer == Arena1Q[1]

    Roadhog2 = 2


/*
rule "Bot actions:":
*/

def StartFacing():
    @Name "SUB: Facing"

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Melee":
    @Event eachPlayer
    @Slot 11
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) < 3
    @Condition eventPlayer.isAlive() == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition Arena1Q[Roadhog2].getHealth() <= 30
    @Condition eventPlayer.isDummy() == true

    eventPlayer.setDamageDealt(100)
    eventPlayer.forceButtonPress(Button.MELEE)


/*
rule "Bot movement:":
*/

rule "2 Side hide stairs":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition distance(Arena1Q[Roadhog2].getEyePosition(), vect(-11.188, 268.367, 276.398)) <= 5
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.getEyePosition().z >= 279
    @Condition BotSeePlayer == 0

    eventPlayer.stopForcingThrottle()
    eventPlayer.startThrottleInDirection(localVector(PathLocStairs[0], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)


rule "2 Side hide deck":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition distance(Arena1Q[Roadhog2].getEyePosition(), vect(-11.188, 268.367, 276.399)) <= 5
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.getEyePosition().z < 279
    @Condition BotSeePlayer == 0

    eventPlayer.stopForcingThrottle()
    eventPlayer.startThrottleInDirection(localVector(PathLocDeck[2], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)


rule "1 Side hide stairs":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition distance(Arena1Q[Roadhog2].getEyePosition(), vect(11.386, 268.667, 276.181)) <= 5
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.getEyePosition().z >= 279
    @Condition BotSeePlayer == 0

    eventPlayer.stopForcingThrottle()
    eventPlayer.startThrottleInDirection(localVector(PathLocStairs[2], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)


rule "1 Side hide deck":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition distance(Arena1Q[Roadhog2].getEyePosition(), vect(11.386, 268.667, 276.181)) <= 5
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.getEyePosition().z < 279
    @Condition BotSeePlayer == 0

    eventPlayer.stopForcingThrottle()
    eventPlayer.startThrottleInDirection(localVector(PathLocDeck[0], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)


/*
rule "Hiding detectors spheres":
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, vect(11.386, 268.667, 276.181), 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, vect(-11.188, 268.367, 276.398), 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
*/

rule "PathLocMiddlePillar":
    PathLoc = vect(-6.881, 268.518, 288.73)
    PathLoc.append(vect(-6.881, 268.518, 288.73))
    PathLoc.append(vect(4.193, 268.517, 287.788))
    PathLoc.append(vect(4.193, 268.517, 287.788))
    PathLoc.append(vect(5.008, 268.684, 274.322))
    PathLoc.append(vect(-4.554, 268.683, 274.323))


rule "BotPathing PathLocMiddle":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getEyePosition().z > 277
    @Condition eventPlayer.getEyePosition().z < 283
    @Condition BotSeePlayer == 1

    PathHelper.remove(PathDirection)
    PathOld = PathDirection
    PathDirection = random.choice(PathHelper)
    PathHelper.append(PathOld)
    eventPlayer.startThrottleInDirection(localVector(PathLoc[PathDirection], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.15, 0.35))
    if RULE_CONDITION:
        goto RULE_START


rule "PathLocDeck":
    PathLocDeck = vect(6.253, 268.518, 269.385)
    PathLocDeck.append(vect(0.577, 268.518, 269.95))
    PathLocDeck.append(vect(-4.748, 268.518, 270.609))
    PathLocDeck.append(vect(-4.452, 268.683, 276.44))
    PathLocDeck.append(vect(-0.23, 268.684, 276.232))
    PathLocDeck.append(vect(5.318, 268.683, 276.305))


rule "BotPathing PathLocDeck":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getEyePosition().z <= 277
    @Condition BotSeePlayer == 1

    PathHelper.remove(PathDirection)
    PathOld = PathDirection
    PathDirection = random.choice(PathHelper)
    PathHelper.append(PathOld)
    eventPlayer.startThrottleInDirection(localVector(PathLocDeck[PathDirection], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.15, 0.35))
    if RULE_CONDITION:
        goto RULE_START


rule "PathLocStairs":
    PathLocStairs = vect(-12.851, 268.367, 283.182)
    PathLocStairs.append(vect(-0.178, 268.533, 283.317))
    PathLocStairs.append(vect(12.7, 268.367, 283.659))
    PathLocStairs.append(vect(6.815, 268.367, 289.419))
    PathLocStairs.append(vect(0.336, 271.134, 293.075))
    PathLocStairs.append(vect(-8.206, 268.367, 289.961))


rule "BotPathing PathLocStairs":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getEyePosition().z >= 283
    @Condition BotSeePlayer == 1

    PathHelper.remove(PathDirection)
    PathOld = PathDirection
    PathDirection = random.choice(PathHelper)
    PathHelper.append(PathOld)
    eventPlayer.startThrottleInDirection(localVector(PathLocStairs[PathDirection], eventPlayer, Transform.ROTATION_AND_TRANSLATION), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.15, 0.35))
    if RULE_CONDITION:
        goto RULE_START


rule "LookingatWall -- ei oikee toimi tai tavallaa toimii - pitäskö tehä 4 eri sectioo ettei hinaa keskustaa kohti?":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition distance(eventPlayer.getEyePosition(), raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getAllPlayers(), eventPlayer, false).getHitPosition()) <= 1
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false

    wait(0.05)
    eventPlayer.startForcingThrottle(0, 0, 0, 0, 1, 1)
    #smallMessage(getAllPlayers(), "looking at wall")
    wait(0.2)
    if RULE_CONDITION:
        goto RULE_START


rule "Zen lookingatWall for long":
    @Event eachPlayer
    @Slot 11
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    #@Condition distance(eventPlayer.getEyePosition(), raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getAllPlayers(), eventPlayer, false).getHitPosition()) <= 2

    wait(4, Wait.ABORT_WHEN_FALSE)
    #smallMessage(getAllPlayers(), "i don't see you 4s zen")
    eventPlayer.stopThrottleInDirection()
    eventPlayer.startForcingThrottle(0, 0, 0, 0, 1, 1)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingThrottle(0, 0, 0, 0, 1, 1)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingThrottle(0, 0, 0, 0, 1, 1)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "not in sight":
    @Event eachPlayer
    @Slot 11
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.isDummy() == true
    @Condition distance(eventPlayer.getEyePosition(), raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getAllPlayers(), eventPlayer, false).getHitPosition()) > 3

    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingThrottle(1, 1, 0, 0, 0, 1)
    #smallMessage(getAllPlayers(), "i don't see you")
    BotSeePlayer = 0


rule "is in sight":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopForcingThrottle()
    #smallMessage(getAllPlayers(), "i see you")
    BotSeePlayer = 1


rule "BotFacing":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true

    StartFacing()


rule "BotLocations":
    PathHelper = 0
    PathHelper.append(1)
    PathHelper.append(2)
    PathHelper.append(3)
    PathHelper.append(4)
    PathHelper.append(5)


/*
rule "Zenyatta:":
*/

rule "Zen Los Reload":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isFiringSecondaryFire() == false

    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    if eventPlayer.getAmmo(0) <= 12:
        eventPlayer.forceButtonPress(Button.RELOAD)


rule "Zen Los Right Click":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isReloading() == false

    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)


rule "Zen Release Right Click":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isFiringSecondaryFire() == true

    wait(0.2, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setDamageDealt(100)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)


rule "Zen Disco":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.isReloading() == false

    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(5)
    if RULE_CONDITION:
        goto RULE_START


rule "Zen Shoot":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.isFiringPrimaryFire() == false
    @Condition eventPlayer.isReloading() == false

    eventPlayer.setDamageDealt(75)
    ZenShoot()
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(0.2)
    StartFacing()
    wait(random.uniform(0.2, 0.4))
    if RULE_CONDITION:
        goto RULE_START


def ZenShoot():
    @Name "Zen Shoot Sub"

    eventPlayer.stopFacing()
    PredictionSpot = distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition())
    PredictionSpot = PredictionSpot / 80
    PredictionSpot = PredictionSpot * Arena1Q[Roadhog2].getVelocity()
    PredictionSpot = PredictionSpot + Arena1Q[Roadhog2].getEyePosition()
    PredictionSpot = vect(PredictionSpot.x, PredictionSpot.y - 0.3, PredictionSpot.z)
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), PredictionSpot), Relativity.TO_WORLD)


rule "Zen Ult":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getCurrentHero() == Hero.ZENYATTA
    @Condition BotSeePlayer == 1
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.getHealth() <= 50
    @Condition eventPlayer.isAlive() == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isDummy() == true

    eventPlayer.forceButtonPress(Button.ULTIMATE)


/*
rule "Hanzo:":
*/

rule "Hanzo Storm Arrows":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    eventPlayer.setDamageDealt(100)


rule "Hanzo Storm Arrows shoot":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true

    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(0.35)
    if RULE_CONDITION:
        goto RULE_START


rule "Hanzo Shoot":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isFiringPrimaryFire() == false

    eventPlayer.setDamageDealt(100)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)


rule "Hanzo Shoot release":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isFiringPrimaryFire() == true

    wait(0.75)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)


rule "Hanzo Los Climb":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition BotSeePlayer == 0
    @Condition eventPlayer.isAlive() == true

    wait(0.2, Wait.ABORT_WHEN_FALSE)
    #smallMessage(getAllPlayers(), "trying to climb")
    eventPlayer.startForcingThrottle(1, 1, 0, 0, 0, 0)
    eventPlayer.startForcingButton(Button.JUMP)
    wait(2)
    eventPlayer.stopForcingButton(Button.JUMP)


rule "Hanzo Lunge":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == false
    @Condition eventPlayer.getAbilityCooldown(Button.JUMP) == 0
    @Condition eventPlayer.isOnWall() == false

    wait(random.uniform(0.2, 0.8), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(random.uniform(0.2, 0.5))
    eventPlayer.forceButtonPress(Button.JUMP)


rule "Hanzo Ult":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getCurrentHero() == Hero.HANZO
    @Condition BotSeePlayer == 0
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.getHealth() >= 130
    @Condition eventPlayer.isAlive() == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isDummy() == true
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) >= 7

    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ULTIMATE)


/*
rule "Baptiste:":
*/

rule "Baptiste Reload":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getAmmo(0) == 0

    eventPlayer.forceButtonPress(Button.RELOAD)


rule "Baptiste Los Reload":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.isAlive() == true

    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    if eventPlayer.getAmmo(0) <= 25:
        eventPlayer.forceButtonPress(Button.RELOAD)


rule "Baptiste Los Jump":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition BotSeePlayer == 0
    @Condition eventPlayer.isAlive() == true

    eventPlayer.startForcingButton(Button.CROUCH)
    wait(random.uniform(0.3, 0.8))
    eventPlayer.stopForcingButton(Button.CROUCH)
    wait(random.uniform(0, 0.9))
    eventPlayer.forceButtonPress(Button.JUMP)


rule "Baptiste Heal":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0
    @Condition eventPlayer.getHealth() <= 150
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    eventPlayer.forceButtonPress(Button.ABILITY_1)


rule "Baptiste Shoot":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition Arena1Q[Roadhog2].isAlive() == true

    eventPlayer.setDamageDealt(35)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Baptiste Ult":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition BotSeePlayer == 1
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.getHealth() >= 100
    @Condition eventPlayer.isAlive() == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.isOnGround() == true
    @Condition Arena1Q[Roadhog2].getHealth() >= 60
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) >= 4

    wait(0.1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopFacing()
    wait()
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 7 - vect(0, 2, 0)), Relativity.TO_WORLD)
    wait(0.032)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(0.1)
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(0.1)
    StartFacing()


/*
rule "Genji:":
*/

rule "Genji Facing":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition FirstMatch == true

    StartFacing()


rule "Genji Los Climb":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition BotSeePlayer == 0
    @Condition eventPlayer.isAlive() == true

    wait(0.5, Wait.ABORT_WHEN_FALSE)
    #smallMessage(getAllPlayers(), "trying to climb")
    eventPlayer.startForcingButton(Button.JUMP)
    eventPlayer.startForcingThrottle(1, 1, 0, 0, 0, 0)
    wait(2)
    eventPlayer.stopForcingButton(Button.JUMP)


rule "Genji Los Reload":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false
    @Condition eventPlayer.isAlive() == true

    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    if eventPlayer.getAmmo(0) <= 10:
        eventPlayer.forceButtonPress(Button.RELOAD)


rule "Genji Left Click":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) >= 10
    @Condition eventPlayer.isFiringPrimaryFire() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition Arena1Q[Roadhog2].isAlive() == true

    eventPlayer.setDamageDealt(75)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)


rule "Genji Right Click":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) < 10
    @Condition eventPlayer.isFiringPrimaryFire() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition Arena1Q[Roadhog2].isAlive() == true

    eventPlayer.setDamageDealt(75)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)


rule "Genji Deflect 56 hp":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getHealth() <= 56
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    @Condition Arena1Q[Roadhog2].isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    eventPlayer.forceButtonPress(Button.ABILITY_2)
    StartFacing()


rule "Genji Dash":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getAltitude() > 3
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) < 14.3
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getPosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), vect(Arena1Q[Roadhog2].getEyePosition().x, Arena1Q[Roadhog2].getEyePosition().y - 1, Arena1Q[Roadhog2].getEyePosition().z)), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait()
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.2)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), vect(Arena1Q[Roadhog2].getEyePosition().x, Arena1Q[Roadhog2].getEyePosition().y - 0.5, Arena1Q[Roadhog2].getEyePosition().z)), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Genji Dash Finish":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) < 14.3
    @Condition Arena1Q[Roadhog2].getHealth() <= 80
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getPosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), vect(Arena1Q[Roadhog2].getEyePosition().x, Arena1Q[Roadhog2].getEyePosition().y - 1, Arena1Q[Roadhog2].getEyePosition().z)), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait()
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.2)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), vect(Arena1Q[Roadhog2].getEyePosition().x, Arena1Q[Roadhog2].getEyePosition().y - 0.5, Arena1Q[Roadhog2].getEyePosition().z)), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Genji Deflect Close":
    @Event eachPlayer
    @Slot 11
    @Condition distance(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition()) < 6
    @Condition eventPlayer.getHealth() < 150
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    @Condition Arena1Q[Roadhog2].isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    eventPlayer.forceButtonPress(Button.ABILITY_2)
    StartFacing()


rule "Genji Deflect Range":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getHealth() < 75
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    @Condition Arena1Q[Roadhog2].isReloading() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition isInLoS(eventPlayer.getEyePosition(), Arena1Q[Roadhog2].getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == true

    eventPlayer.forceButtonPress(Button.ABILITY_2)
    StartFacing()


rule "Genji Double Jumps":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == false
    @Condition eventPlayer.isOnWall() == false

    wait(random.uniform(0.2, 0.8), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.JUMP)
    eventPlayer.Randomizer = random.randint(0, 5)
    if eventPlayer.Randomizer == 0:
        return
    wait(random.uniform(0.2, 0.5))
    eventPlayer.forceButtonPress(Button.JUMP)


rule "Genji Ult":
    @Event eachPlayer
    @Slot 11
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition BotSeePlayer == 1
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.getHealth() >= 135
    @Condition eventPlayer.isAlive() == true
    @Condition Arena1Q[Roadhog2].isAlive() == true
    @Condition eventPlayer.isDummy() == true
    @Condition Arena1Q[Roadhog2].getHealth() >= 100

    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(0.6)
    while eventPlayer.isUsingUltimate() == true:
        eventPlayer.setDamageDealt(100)
        eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
        eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
        eventPlayer.startForcingThrottle(1, 1, 0, 0, 0, 1)
        wait(0.25)


rule "Echo duplicate nerf":
    @Event eachPlayer
    @Condition eventPlayer.isDuplicatingAHero() == true
    @Condition eventPlayer.isAlive() == true

    wait(7, Wait.ABORT_WHEN_FALSE)
    damage(eventPlayer, null, 1000)
