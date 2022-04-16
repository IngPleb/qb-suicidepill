local Translations = {
    info = {
        timeLeft = "Zostávajúci cas: %{timeleft}",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})