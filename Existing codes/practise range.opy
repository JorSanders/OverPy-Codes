settings {
    "main": {
        "description": "Twitter: @PMAJellies for More Workshops!",
        "modeName": "Practice Range 3.0"
    },
    "lobby": {
        "allowPlayersInQueue": true
    },
    "gamemodes": {
        "practiceRange": {},
        "general": {
            "heroLimit": "off",
            "respawnTime%": 10,
            "spawnTrainingBots": false,
            "trainingBotsRespawnTime%": 30
        }
    },
    "heroes": {
        "team2": {
            "pharah": {
                "enableSecondaryFireUnlimitedFuel": true,
                "ability1Cooldown%": 0
            }
        },
        "allTeams": {
            "hammond": {
                "enableRollOnly": true
            },
            "general": {
                "enableSpawningWithUlt": true
            }
        }
    }
}

#Global variables

globalvar Buttons 0
globalvar Jumps 1
globalvar Tethers 2
globalvar Settings 3
globalvar Training1 4
globalvar Training2 5
globalvar TrainingHeroes 6
globalvar DamageNumbers 7
globalvar DamageText 8
globalvar TileSize 9
globalvar Tiles 10
globalvar TilesStarted 11
globalvar TileSlots 12
globalvar TileOne 13
globalvar TileTwo 14
globalvar TileThree 15
globalvar i 16
globalvar j 17
globalvar TilesDown 18
globalvar TilesRight 19
globalvar TileTemp 20
globalvar TilePlayer 21
globalvar ElimStarted 22
globalvar ElimNum 23
globalvar ElimNumText 24
globalvar u 25
globalvar v 26
globalvar BounceStarted 27
globalvar w 28
globalvar BallStarted 29
globalvar BallScale 30
globalvar BallJump 31
globalvar BallSpeed 32
globalvar PharahBot 33
globalvar x 34
globalvar y 35
globalvar P 36
globalvar P2 37


#Player variables

playervar InfAmmo 0
playervar Cooldowns 1
playervar OneShot 2
playervar OldAmmo 3
playervar Hero 4


#Subroutine names

subroutine CreateGrid 0
subroutine Elimination 1
subroutine Bounce 2


rule "Global Variables":
    Buttons[0] = vect(44.56, -1.1, -0.64)
    Tiles[0] = vect(44.72, 3.86, 7.8)
    Buttons[2] = vect(73.48, -0.61, -19.4)
    Buttons[3] = vect(84.83, -0.19, -11.19)
    Buttons[4] = vect(84.38, -1.09, 10.24)
    Buttons[5] = vect(75.06, -2.62, 47.4)
    Buttons[6] = vect(34.57, 3.5, 17.92)
    Buttons[7] = vect(69.8, 7.41, -14.18)
    Buttons[8] = vect(54.78, 8.85, -22.39)
    Buttons[9] = vect(57.23, 12.3, 1.87)
    Buttons[10] = vect(7.53, 3.38, -10.22)
    Jumps[0] = vect(56.57, -2, -7)
    Jumps[1] = vect(29.84, 2.09, 4.47)
    Jumps[2] = vect(20.15, 2, 5.95)
    Tethers[0] = vect(46.39, 11.91, -6.25)
    Tethers[1] = vect(75.99, 15.82, 19.41)
    Tethers[2] = vect(50.01, 11.91, 12.85)
    Settings[0] = vect(42.56, 2.54, 33.74)
    Settings[1] = vect(44.59, 2.6, 31.39)
    Settings[2] = vect(47.42, 2.53, 30.76)
    Settings[3] = vect(57.99, 2.56, 30.92)
    Training1[0] = vect(103.07, -4, 28.46)
    Training1[1] = vect(100.58, -4, 33.93)
    Training1[2] = vect(97.22, -4, 39.2)
    Training1[3] = vect(93.15, -4, 43.43)
    Training1[4] = vect(92.26, -2, -6.5)
    Training2[0] = vect(85.7, -2, 16.23)
    Training2[1] = vect(86.35, -4, 23.34)
    Training2[2] = vect(80.74, -4, 27.26)
    Training2[3] = vect(79.61, -4, 33.87)
    TrainingHeroes[0] = Hero.ZENYATTA
    TrainingHeroes[1] = Hero.MOIRA
    TrainingHeroes[2] = Hero.SOJOURN
    TrainingHeroes[3] = Hero.MCCREE
    TrainingHeroes[4] = Hero.BAPTISTE
    TrainingHeroes[5] = Hero.SOLDIER
    TrainingHeroes[6] = Hero.JUNKRAT
    TrainingHeroes[7] = Hero.WIDOWMAKER
    TileSize = 0.17
    Tiles[1] = vect(43.32, 7.06, 8.38)
    Tiles[2] = vect(45.02, 7.06, 9.59)
    TileSlots = []
    disableAnnouncer()
    disableInspector()


rule "Player Variables":
    @Event eachPlayer
    @Team 1

    eventPlayer.disableMessages()
    eventPlayer.disableKillFeed()
    eventPlayer.InfAmmo = 0
    eventPlayer.Cooldowns = 0
    eventPlayer.OneShot = 0
    #hudSubheader(getAllPlayers(), eventPlayer.getFacingDirection(), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    #hudSubheader(getAllPlayers(), eventPlayer.getPosition(), HudPosition.LEFT, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    #hudSubheader(getAllPlayers(), raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 1000, null, eventPlayer, true).getHitPosition(), HudPosition.LEFT, 0, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), eventPlayer.getUltCharge(), HudPosition.LEFT, 0, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


rule "Effects":
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[0], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, Tiles[0], TileSize, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[2], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[3], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[4], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[6], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[5], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[7], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[8], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[9], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[10], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Buttons[10], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, Jumps[0], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, Jumps[1], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, Jumps[2], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, Tethers[0], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, Tethers[1], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, Tethers[2], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Settings[0], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Settings[1], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Settings[2], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Settings[3], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Tiles[1], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Tiles[2], 0.17, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Infinite Ammo", vect(0, 0.4, 0) + Settings[0], 0.7, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "No Cooldowns", vect(0, 0.4, 0) + Settings[1], 0.7, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "One Shot Kill", vect(0, 0.4, 0) + Settings[2], 0.7, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "Damage Numbers", vect(0, 0.4, 0) + Settings[3], 0.7, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), "Press {0} to Interact".format(buttonString(Button.INTERACT)), vect(52.26, 6, 28.54), 1.3, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


rule "Training Bot":
    createDummy(random.choice(TrainingHeroes), Team.2, 1, Training1[0], vect(-1, 0, 0))
    createDummy(random.choice(TrainingHeroes), Team.2, 2, Training1[1], vect(-1, 0, 0))
    createDummy(random.choice(TrainingHeroes), Team.2, 3, Training1[2], vect(-1, 0, 0))
    createDummy(random.choice(TrainingHeroes), Team.2, 4, Training1[3], vect(-1, 0, 0))
    createDummy(random.choice(TrainingHeroes), Team.2, 5, Training1[4], vect(-0.57, 0, 0.82))


rule "Training Bot 1 Movement":
    @Event eachPlayer
    @Team 2
    @Slot 1
    @Condition eventPlayer.isAlive() == true
    @Condition BounceStarted == 0

    while eventPlayer.isAlive() and BounceStarted == 0:
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[0]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(4, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training1[0]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(1, Wait.ABORT_WHEN_FALSE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(4, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[0]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(1, Wait.ABORT_WHEN_FALSE)


rule "Training Bot 2 Movement":
    @Event eachPlayer
    @Team 2
    @Slot 2
    @Condition eventPlayer.isAlive() == true
    @Condition BounceStarted == 0

    while eventPlayer.isAlive() and BounceStarted == 0:
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[1]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(3, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training1[1]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(0.8, Wait.ABORT_WHEN_FALSE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(3, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[1]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(0.8, Wait.ABORT_WHEN_FALSE)


rule "Training Bot 3 Movement":
    @Event eachPlayer
    @Team 2
    @Slot 3
    @Condition eventPlayer.isAlive() == true
    @Condition BounceStarted == 0

    while eventPlayer.isAlive() and BounceStarted == 0:
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[2]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(4, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training1[2]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(1.2, Wait.ABORT_WHEN_FALSE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(4, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[2]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(1.2, Wait.ABORT_WHEN_FALSE)


rule "Training Bot 4 Movement":
    @Event eachPlayer
    @Team 2
    @Slot 4
    @Condition eventPlayer.isAlive() == true
    @Condition BounceStarted == 0
    @Condition BallStarted == 0

    while eventPlayer.isAlive() and BounceStarted == 0 and BallStarted == 0:
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[3]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(3.2, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training1[3]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(1, Wait.ABORT_WHEN_FALSE)
        eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
        wait(3.2, Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopThrottleInDirection()
        eventPlayer.startFacing(directionTowards(eventPlayer.getPosition(), Training2[3]), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopThrottleInDirection()
    eventPlayer.stopFacing()


rule "Training Bot Dies":
    @Event playerDied
    @Team 2
    @Condition eventPlayer.isDummy() == true
    @Condition (eventPlayer.getSlot() == 1 or eventPlayer.getSlot() == 2 or eventPlayer.getSlot() == 3 or eventPlayer.getSlot() == 4 or eventPlayer.getSlot() == 5) == true

    wait(1)
    eventPlayer.respawn()
    wait(0.05)
    if eventPlayer.getSlot() == 1 and BounceStarted == 0:
        eventPlayer.startForcingHero(random.choice(TrainingHeroes))
        eventPlayer.teleport(Training1[0])
        eventPlayer.setFacing(directionTowards(Training1[0], Training2[0]), Relativity.TO_WORLD)
    if eventPlayer.getSlot() == 2 and BounceStarted == 0:
        eventPlayer.startForcingHero(random.choice(TrainingHeroes))
        eventPlayer.teleport(Training1[1])
        eventPlayer.setFacing(directionTowards(Training1[1], Training2[1]), Relativity.TO_WORLD)
    if eventPlayer.getSlot() == 3 and BounceStarted == 0:
        eventPlayer.startForcingHero(random.choice(TrainingHeroes))
        eventPlayer.teleport(Training1[2])
        eventPlayer.setFacing(directionTowards(Training1[2], Training2[2]), Relativity.TO_WORLD)
    if eventPlayer.getSlot() == 4 and BounceStarted == 0:
        eventPlayer.startForcingHero(random.choice(TrainingHeroes))
        eventPlayer.teleport(Training1[3])
        eventPlayer.setFacing(directionTowards(Training1[3], Training2[3]), Relativity.TO_WORLD)
    if eventPlayer.getSlot() == 5 and ElimStarted == 0:
        eventPlayer.startForcingHero(random.choice(TrainingHeroes))
        eventPlayer.teleport(Training1[4])
        eventPlayer.setFacing(vect(-0.57, 0, 0.82), Relativity.TO_WORLD)


rule "Infinite Ammo":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Settings[0]), null, eventPlayer, true).getHitPosition(), Settings[0]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if eventPlayer.InfAmmo == 0:
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, Settings[0], 100)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, Settings[0], 1)
        eventPlayer.OldAmmo[0] = eventPlayer.getAmmo(0)
        eventPlayer.OldAmmo[1] = eventPlayer.getAmmo(1)
        wait(0.3)
        eventPlayer.setAmmo(0, 9999)
        eventPlayer.setMaxAmmo(0, 9999)
        eventPlayer.setAmmo(1, 9999)
        eventPlayer.setMaxAmmo(1, 9999)
        eventPlayer.InfAmmo = 1
        smallMessage(eventPlayer, "Infinite Ammo: ON")
    else:
        playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, Settings[0], 100)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, Settings[0], 1)
        wait(0.3)
        eventPlayer.setAmmo(0, eventPlayer.OldAmmo[0])
        eventPlayer.setMaxAmmo(0, eventPlayer.OldAmmo[0])
        eventPlayer.setAmmo(1, eventPlayer.OldAmmo[1])
        eventPlayer.setMaxAmmo(1, eventPlayer.OldAmmo[1])
        eventPlayer.InfAmmo = 0
        smallMessage(eventPlayer, "Infinite Ammo: OFF")


rule "Inf Ammo Shooting":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.InfAmmo == 1
    @Condition eventPlayer.getAmmo(0) <= 10
    @Condition (eventPlayer.isFiringPrimaryFire() == true or eventPlayer.isFiringSecondaryFire() == true) == true

    wait(0.5)
    eventPlayer.setAmmo(0, eventPlayer.getMaxAmmo(0))
    eventPlayer.setAmmo(1, eventPlayer.getMaxAmmo(1))


rule "No Cooldowns":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Settings[1]), null, eventPlayer, true).getHitPosition(), Settings[1]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if eventPlayer.Cooldowns == 0:
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, Settings[1], 100)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, Settings[1], 1)
        wait(0.3)
        eventPlayer.Cooldowns = 1
        smallMessage(eventPlayer, "No Cooldowns: ON")
    else:
        playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, Settings[1], 100)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, Settings[1], 1)
        wait(0.3)
        eventPlayer.Cooldowns = 0
        smallMessage(eventPlayer, "No Cooldowns: OFF")


rule "No Cooldowns Timer":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition (eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0 or eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0 or eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0) == true
    @Condition eventPlayer.Cooldowns == 1

    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)


rule "One Shot Kill":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Settings[2]), null, eventPlayer, true).getHitPosition(), Settings[2]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if eventPlayer.OneShot == 0:
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, Settings[2], 100)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, Settings[2], 1)
        wait(0.3)
        eventPlayer.OneShot = 1
        smallMessage(eventPlayer, "One Shot Kill: ON")
        eventPlayer.setDamageDealt(10000000)
        getPlayers(Team.2).setDamageReceived(1000000)
    else:
        playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, Settings[2], 100)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, Settings[2], 1)
        wait(0.3)
        eventPlayer.OneShot = 0
        smallMessage(eventPlayer, "One Shot Kill: OFF")
        eventPlayer.setDamageDealt(100)
        getPlayers(Team.2).setDamageReceived(100)


rule "Damage Numbers":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Settings[3]), null, eventPlayer, true).getHitPosition(), Settings[3]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if DamageNumbers == 0:
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, Settings[3], 100)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, Settings[3], 1)
        wait(0.3)
        DamageNumbers = 1
        smallMessage(getPlayers(Team.1), "Damage Numbers: ON")
    else:
        playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, Settings[3], 100)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, Settings[3], 1)
        wait(0.3)
        DamageNumbers = 0
        smallMessage(getPlayers(Team.1), "Damage Numbers: OFF")


rule "Get Ulitmate on Q":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.getUltCharge() < 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true

    if eventPlayer.getUltCharge() != 0:
        wait(0.5)
        eventPlayer.setUltCharge(100)
        wait(2)
        if eventPlayer.getUltCharge() < 100:
            eventPlayer.setUltCharge(100)


rule "Show Damage Numbers":
    @Event playerDealtDamage
    @Team 1
    @Condition DamageNumbers == 1

    destroyInWorldText(DamageText)
    createInWorldText(getAllPlayers(), eventDamage, vect(0, 0.4, 0) + victim.getEyePosition(), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    DamageText = getLastCreatedText()
    wait(1.2, Wait.RESTART_WHEN_TRUE)
    destroyInWorldText(DamageText)


rule "Player Spawned":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.Hero != eventPlayer.getCurrentHero()

    eventPlayer.InfAmmo = 0
    eventPlayer.Cooldowns = 0
    eventPlayer.OneShot = 0
    eventPlayer.Hero = eventPlayer.getCurrentHero()
    eventPlayer.setDamageDealt(100)
    getPlayers(Team.2).setDamageReceived(100)


rule "Jump Pads":
    @Event eachPlayer
    @Team 1
    @Condition (distance(eventPlayer.getPosition(), Jumps[0]) < 1 or distance(eventPlayer.getPosition(), Jumps[1]) < 1 or distance(eventPlayer.getPosition(), Jumps[2]) < 1) == true

    eventPlayer.applyImpulse(vect(0, 1, 0), 20, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)


rule "Tether 0":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Tethers[0]), null, eventPlayer, true).getHitPosition(), Tethers[0]) < 0.4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    eventPlayer.applyImpulse(vect(0, 0.5, 0) + directionTowards(eventPlayer.getEyePosition(), Tethers[0]), sqrt(distance(eventPlayer.getEyePosition(), Tethers[0])) * 6, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)


rule "Tether 1":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Tethers[1]), null, eventPlayer, true).getHitPosition(), Tethers[1]) < 0.4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    eventPlayer.applyImpulse(vect(0, 0.5, 0) + directionTowards(eventPlayer.getEyePosition(), Tethers[1]), sqrt(distance(eventPlayer.getEyePosition(), Tethers[1])) * 6, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)


rule "Tether 2":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Tethers[2]), null, eventPlayer, true).getHitPosition(), Tethers[2]) < 0.4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    eventPlayer.applyImpulse(vect(0, 0.5, 0) + directionTowards(eventPlayer.getEyePosition(), Tethers[2]), sqrt(distance(eventPlayer.getEyePosition(), Tethers[2])) * 6, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)


rule "Tiles Start / Stop":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Tiles[0]), null, eventPlayer, true).getHitPosition(), Tiles[0]) < TileSize
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if TilesStarted == 0:
        Tiles[0] = vect(46.7, 7.06, 10.77)
        TilesStarted = 1
        CreateGrid()
        TilePlayer = eventPlayer
        eventPlayer.setPrimaryFireEnabled(false)
        eventPlayer.setSecondaryFireEnabled(false)
    elif TilePlayer == eventPlayer:
        Tiles[0] = vect(44.72, 3.86, 7.8)
        TilesStarted = 0
        TileSlots = []
        TileOne = vect(0, -1000, 0)
        TileTwo = vect(0, -1000, 0)
        TileThree = vect(0, -1000, 0)
        TilePlayer = null
        eventPlayer.setPrimaryFireEnabled(true)
        eventPlayer.setSecondaryFireEnabled(true)


rule "Tiles Increase":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Tiles[2]), null, eventPlayer, true).getHitPosition(), Tiles[2]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition TilesStarted == 0

    if TileSize < 0.3:
        TileSize += 0.02


rule "Tiles Decrease":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Tiles[1]), null, eventPlayer, true).getHitPosition(), Tiles[1]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition TilesStarted == 0

    if TileSize > 0.03:
        TileSize += -0.02


def CreateGrid():
    @Name "Create Grid"

    TilesDown = -1 + floor(1.65 / TileSize)
    TilesRight = -1 + floor(1.975 / TileSize)
    wait(0.1)
    for i in range(TilesDown):
        for j in range(TilesRight):
            TileSlots[j + i * TilesRight] = vect(43 + j * (3.95 / TilesRight), 5.45 + i * (-3.3 / TilesDown), 6.58 + j * (2.8 / TilesRight))
    TilesStarted = 1
    i = 0
    wait(0.1)
    TileOne = random.choice(TileSlots)
    if TileSize <= 0.13:
        goto lbl_0
    TileSlots = TileSlots.exclude(TileOne)
    lbl_0:
    TileTwo = random.choice(TileSlots)
    if TileSize <= 0.13:
        goto lbl_1
    TileSlots = TileSlots.exclude(TileTwo)
    lbl_1:
    TileThree = random.choice(TileSlots)
    if TileSize <= 0.13:
        goto lbl_2
    TileSlots = TileSlots.exclude(TileThree)
    lbl_2:
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, TileOne, TileSize, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, TileTwo, TileSize, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, TileThree, TileSize, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Tile One":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), TileOne), null, eventPlayer, true).getHitPosition(), TileOne) < TileSize
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true) == true
    @Condition TilesStarted == 1

    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, TileOne, 100)
    TileTemp = TileOne
    TileOne = random.choice(TileSlots)
    if TileSize <= 0.13:
        goto lbl_0
    TileSlots = TileSlots.exclude(TileOne)
    lbl_0:
    TileSlots.append(TileTemp)


rule "Tile Two":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), TileTwo), null, eventPlayer, true).getHitPosition(), TileTwo) < TileSize
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true) == true
    @Condition TilesStarted == 1

    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, TileTwo, 100)
    TileTemp = TileTwo
    TileTwo = random.choice(TileSlots)
    if TileSize <= 0.13:
        goto lbl_0
    TileSlots = TileSlots.exclude(TileTwo)
    lbl_0:
    TileSlots.append(TileTemp)


rule "Tile Three":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), TileThree), null, eventPlayer, true).getHitPosition(), TileThree) < TileSize
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true) == true
    @Condition TilesStarted == 1

    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, TileThree, 100)
    TileTemp = TileThree
    TileThree = random.choice(TileSlots)
    if TileSize <= 0.13:
        goto lbl_0
    TileSlots = TileSlots.exclude(TileThree)
    lbl_0:
    TileSlots.append(TileTemp)


rule "Eliminate Start":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Buttons[2]), null, eventPlayer, true).getHitPosition(), Buttons[2]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if ElimStarted == 0:
        ElimNum = 25
        ElimStarted = 1
        Elimination()


def Elimination():
    @Name "Elimination"

    createInWorldText(getAllPlayers(), ElimNum, vect(0, 2.5, 0) + Buttons[2], 2, Clip.SURFACES, WorldTextReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    Buttons[2] = vect(0, -1000, 0)
    ElimNumText = getLastCreatedText()
    u = random.uniform(0, 1)
    v = random.uniform(0, 1)
    createDummy(Hero.ZENYATTA, Team.2, 5, vect(59.3 + u * 7.9 + v * 11, -2, -10.75 + u * -11.08 + v * 7.9), vect(-0.6, 0, 0.8))
    wait(0.05)
    getPlayersInSlot(5, Team.2).setMaxHealth(50)
    getPlayersInSlot(5, Team.2).startFacing(vect(-0.6, 0, 0.8), 1000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Elim Bot Dies":
    @Event playerDied
    @Team 2
    @Slot 5
    @Condition ElimStarted == 1

    ElimNum += -1
    destroyDummy(Team.2, 5)
    u = random.uniform(0, 1)
    v = random.uniform(0, 1)
    createDummy(Hero.ZENYATTA, Team.2, 5, vect(59.3 + u * 7.9 + v * 11, -2, -10.75 + u * -11.08 + v * 7.9), vect(-0.6, 0, 0.8))


rule "Elim Bot":
    @Event eachPlayer
    @Team 2
    @Slot 5
    @Condition ElimStarted == 1

    wait(0.05)
    eventPlayer.setMaxHealth(50)
    eventPlayer.startFacing(vect(-0.6, 0, 0.8), 1000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Eliminate Finished":
    @Condition ElimStarted == 1
    @Condition ElimNum == 0

    smallMessage(getPlayers(Team.1), "TEST3")
    destroyDummy(Team.2, 5)
    Buttons[2] = vect(73.48, -0.61, -19.4)
    ElimNum = 0
    ElimStarted = 0
    destroyInWorldText(ElimNumText)
    wait(0.5)
    createDummy(random.choice(TrainingHeroes), Team.2, 5, Training1[4], vect(-0.57, 0, 0.82))
    getPlayersInSlot(5, Team.2).setMaxHealth(100)


rule "Bounce Start":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Buttons[7]), null, eventPlayer, true).getHitPosition(), Buttons[7]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if BounceStarted == 0:
        wait(0.5)
        BounceStarted = 1
        Bounce()
    elif BounceStarted == 1:
        wait(0.5)
        BounceStarted = 0
        destroyDummy(Team.2, 1)
        destroyDummy(Team.2, 2)
        destroyDummy(Team.2, 3)
        destroyDummy(Team.2, 4)
        wait(0.2)
        createDummy(random.choice(TrainingHeroes), Team.2, 1, Training1[0], vect(-1, 0, 0))
        createDummy(random.choice(TrainingHeroes), Team.2, 2, Training1[1], vect(-1, 0, 0))
        createDummy(random.choice(TrainingHeroes), Team.2, 3, Training1[2], vect(-1, 0, 0))
        createDummy(random.choice(TrainingHeroes), Team.2, 4, Training1[3], vect(-1, 0, 0))


def Bounce():
    @Name "Bounce"

    destroyDummy(Team.2, 1)
    destroyDummy(Team.2, 2)
    destroyDummy(Team.2, 3)
    destroyDummy(Team.2, 4)
    wait(0.2)
    createDummy(random.choice(TrainingHeroes), Team.2, 1, vect(0, 0, 0), vect(-0.58, 0, 0.82))
    createDummy(random.choice(TrainingHeroes), Team.2, 2, vect(0, 0, 0), vect(-0.58, 0, 0.82))
    createDummy(random.choice(TrainingHeroes), Team.2, 3, vect(0, 0, 0), vect(-0.58, 0, 0.82))
    createDummy(random.choice(TrainingHeroes), Team.2, 4, vect(0, 0, 0), vect(-0.58, 0, 0.82))
    getPlayersInSlot(1, Team.2).stopThrottleInDirection()
    getPlayersInSlot(2, Team.2).stopThrottleInDirection()
    getPlayersInSlot(3, Team.2).stopThrottleInDirection()
    getPlayersInSlot(4, Team.2).stopThrottleInDirection()


rule "Bounce Bots":
    @Event eachPlayer
    @Team 2
    @Condition BounceStarted == 1
    @Condition (eventPlayer.getSlot() == 1 or eventPlayer.getSlot() == 2 or eventPlayer.getSlot() == 3 or eventPlayer.getSlot() == 4) == true
    @Condition eventPlayer.getPosition().y < -1

    eventPlayer.stopFacing()
    eventPlayer.startFacing(vect(-0.58, 0, 0.82), 1000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.setStatusEffect(null, Status.ROOTED, 9999)
    if random.randint(0, 1) == 0:
        w = random.uniform(0, 0.3)
        eventPlayer.teleport(vect(69.47 + w * 12.65, random.uniform(0, 2), -27.06 + w * 8.2))
        eventPlayer.applyImpulse(vect(6, random.uniform(35, 45), 0), random.uniform(18, 21), Relativity.TO_PLAYER, Impulse.CANCEL_CONTRARY_MOTION)
    else:
        w = random.uniform(0.7, 1)
        eventPlayer.teleport(vect(69.47 + w * 12.65, random.uniform(0, 2), -27.06 + w * 8.2))
        eventPlayer.applyImpulse(vect(-6, random.uniform(35, 45), 0), random.uniform(18, 21), Relativity.TO_PLAYER, Impulse.CANCEL_CONTRARY_MOTION)


rule "Bounce Bot Dies":
    @Event playerDied
    @Team 2
    @Condition BounceStarted == 1
    @Condition (eventPlayer.getSlot() == 1 or eventPlayer.getSlot() == 2 or eventPlayer.getSlot() == 3 or eventPlayer.getSlot() == 4) == true

    createDummy(random.choice(TrainingHeroes), Team.2, eventPlayer.getSlot(), vect(0, 0, 0), vect(-0.58, 0, 0.82))


rule "Ball Track":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Buttons[9]), null, eventPlayer, true).getHitPosition(), Buttons[9]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if BallStarted == 0:
        wait(0.5)
        BallStarted = 1
        while BallStarted == 1:
            if random.randint(0, 1) == 0:
                createDummy(Hero.HAMMOND, Team.2, 4, vect(58.06, 7.24, -19.56), vect(0.82, 0, 0.58))
            else:
                createDummy(Hero.HAMMOND, Team.2, 4, vect(78.73, 7.32, -4.87), vect(-0.82, 0, -0.58))
            wait(4, Wait.RESTART_WHEN_TRUE)
            destroyDummy(Team.2, 4)
            wait(0.5, Wait.RESTART_WHEN_TRUE)
    elif BallStarted == 1:
        wait(0.5)
        BallStarted = 0
        destroyDummy(Team.2, 4)
        wait(0.2)
        createDummy(random.choice(TrainingHeroes), Team.2, 4, Training1[3], vect(-1, 0, 0))


rule "Wrecking Ball Track Movement":
    @Event eachPlayer
    @Team 2
    @Slot 4
    @Condition BallStarted == 1
    @Condition eventPlayer.getCurrentHero() == Hero.HAMMOND

    BallScale = 1.75
    eventPlayer.setMoveSpeed(BallScale * 50)
    wait(0.7)
    eventPlayer.startThrottleInDirection(vect(0, 0, 1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    eventPlayer.startScalingSize(BallScale, true)
    BallJump = random.randint(0, 7)
    BallSpeed = random.uniform(7, 20)
    while BallStarted == 1 and BallJump != 0:
        if eventPlayer.isOnGround():
            eventPlayer.applyImpulse(vect(0, 1, 0), BallSpeed, Relativity.TO_PLAYER, Impulse.INCORPORATE_CONTRARY_MOTION)
            BallSpeed -= 1.8
        wait(0.1)


rule "Wrecking Ball Damaged":
    @Event playerTookDamage
    @Team 2
    @Slot 4
    @Condition BallStarted == 1
    @Condition eventPlayer.getCurrentHero() == Hero.HAMMOND

    BallScale -= 0.1
    #eventPlayer.setMoveSpeed(100 + 20 / BallScale)


rule "Pharah Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * distance(eventPlayer.getEyePosition(), Buttons[4]), null, eventPlayer, true).getHitPosition(), Buttons[4]) < 0.17
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if PharahBot == 0:
        wait(0.5)
        PharahBot = 1
        x = random.uniform(0, 1)
        y = random.uniform(0, 1)
        createDummy(Hero.PHARAH, Team.2, 0, vect(94.99 + x * 14.12 + y * -8.82, 5, -2.56 + x * 9.29 + y * 12.6), vect(-0.77, -0.61, 0.19))
    elif PharahBot == 1:
        wait(0.5)
        PharahBot = 0
        destroyDummy(Team.2, 0)
        wait(0.2)
        createDummy(Hero.TRACER, Team.2, 0, vect(34.35, 2.14, 22.91), vect(0.6, 0, -0.8))


rule "Pharah Bot Movement Up/Down":
    @Event eachPlayer
    @Team 2
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition PharahBot == 1

    while eventPlayer.isAlive():
        if eventPlayer.getEyePosition().y >= 14:
            goto lbl_0
        eventPlayer.startForcingButton(Button.JUMP)
        wait(random.uniform(0.5, 0.9), Wait.ABORT_WHEN_FALSE)
        eventPlayer.stopForcingButton(Button.JUMP)
        lbl_0:
        wait(random.uniform(0.4, 0.85), Wait.ABORT_WHEN_FALSE)
        if eventPlayer.getEyePosition().y <= -3:
            eventPlayer.forceButtonPress(Button.ABILITY_1)
            eventPlayer.startThrottleInDirection(vect(0, 0, -1), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
            wait(0.8, Wait.ABORT_WHEN_FALSE)
            eventPlayer.stopThrottleInDirection()


rule "Pharah Bot Movement Circle":
    @Event eachPlayer
    @Team 2
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition PharahBot == 1

    while eventPlayer.isAlive():
        if distance(eventPlayer.getPosition(), vect(97.64, 5, 8.385)) >= 10.5:
            eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), vect(97.64, 5, 8.385)), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
            wait(random.uniform(0.5, 0.9), Wait.ABORT_WHEN_FALSE)
            eventPlayer.stopThrottleInDirection()
        else:
            eventPlayer.startThrottleInDirection(vect(random.uniform(-1, 1), 0, random.uniform(-1, 1)), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
            wait(random.uniform(0.3, 0.8), Wait.ABORT_WHEN_FALSE)


rule "Pharah Bot Dies":
    @Event playerDied
    @Team 2
    @Slot 0
    @Condition PharahBot == 1
    @Condition eventPlayer.isDummy() == true

    wait(0.5)
    createDummy(Hero.PHARAH, Team.2, 0, vect(94.99 + x * 14.12 + y * -8.82, 5, -2.56 + x * 9.29 + y * 12.6), vect(-0.77, -0.61, 0.19))


rule "Mercy Pocket Spawn":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isCommunicating(Comms.NEED_HEALING) == true
    @Condition eventPlayer.isDummy() == false

    smallMessage(eventPlayer, "Mercy Pocket: ON")
    createDummy(Hero.MERCY, Team.1, -1, eventPlayer.getPosition(), directionTowards(eventPlayer.getPosition(), eventPlayer.getEyePosition()))
    P = eventPlayer


rule "Mercy Pocket Part 1":
    @Event eachPlayer
    @Team 1
    @Hero mercy
    @Condition eventPlayer.isDummy() == true

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), P.getEyePosition()), 1000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    getPlayersOnHero(Hero.MERCY, Team.1).startForcingButton(Button.SECONDARY_FIRE)


rule "Mercy Pocket Part 2":
    @Event eachPlayer
    @Team 1
    @Hero mercy
    @Condition distance(eventPlayer.getPosition(), P.getPosition()) >= 3
    @Condition eventPlayer.isDummy() == true

    eventPlayer.startForcingButton(Button.ABILITY_1)


rule "Mercy Pocket Part 3":
    @Event eachPlayer
    @Team 1
    @Hero mercy
    @Condition (isInLoS(eventPlayer.getEyePosition(), P.getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS) == false or distance(eventPlayer, eventPlayer.getPosition()) >= 14) == true
    @Condition eventPlayer.isDummy() == true

    eventPlayer.teleport(P.getPosition())


rule "Ana Nano Boost Spawn":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isCommunicatingSpray() == true

    smallMessage(eventPlayer, "Ana Nano Boost")
    P2 = eventPlayer
    createDummy(Hero.ANA, Team.1, -1, eventPlayer.getPosition() - eventPlayer.getFacingDirection(), directionTowards(eventPlayer.getPosition() - eventPlayer.getFacingDirection(), eventPlayer.getEyePosition()))


rule "Ana Nano Bot":
    @Event eachPlayer
    @Team 1
    @Hero ana
    @Condition eventPlayer.isDummy() == true

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), P2.getEyePosition()), 5100, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(0.05)
    getPlayersOnHero(Hero.ANA, Team.1).setUltCharge(100)
    wait(0.15)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(8)
    destroyDummy(Team.1, eventPlayer.getSlot())
