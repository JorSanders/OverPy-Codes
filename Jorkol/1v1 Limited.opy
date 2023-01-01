settings {
    "main": {
        "description": "Code: 0WR2E Version: 1.0.0 - 1v1 limited selection but fast",
        "modeName": "1v1 limited"
    },
    "lobby": {
        "spectatorSlots": 12
    },
    "gamemodes": {
        "elimination": {
            "enabledMaps": [
                "blackForest",
                "castillo",
            ],
            "heroesAvailable": "limited",
            "scoreToWin": 5
        },
    },
    "heroes": {
        "allTeams": {
            "disabledHeroes": [
                "brigitte",
                "dva",
                "doomfist",
                "lucio",
                "mercy",
                "moira",
                "orisa",
                "reinhardt",
                "roadhog",
                "sigma",
                "symmetra",
                "torbjorn",
                "winston",
                "hammond",
                "zarya",
                "ramattra",
            ]
        }
    }
}

rule "Skip Assemble Heros":
    @Condition isAssemblingHeroes()

    wait(5)

    setMatchTime(0)
