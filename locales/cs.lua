local Translations = {
    info = {
        timeLeft = "Zbývající cas: %{timeleft}",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})