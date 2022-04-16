local Translations = {
    info = {
        timeLeft = "Time left: %{timeleft}",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})