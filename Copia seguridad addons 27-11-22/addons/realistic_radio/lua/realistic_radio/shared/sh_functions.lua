--[[ Make sure sentence exist and also langage exist]]
function Realistic_Radio.GetSentence(string)
    local result = "Lang Problem"
    local sentence = istable(Realistic_Radio.Language[Realistic_Radio.Lang]) and Realistic_Radio.Language[Realistic_Radio.Lang][string] or "Lang Problem"

    if istable(Realistic_Radio.Language[Realistic_Radio.Lang]) and isstring(sentence) then
        result = sentence
    elseif istable(Realistic_Radio.Language["en"]) and isstring(Realistic_Radio.Language["en"][sentence]) then
        result = Realistic_Radio.Language["en"][sentence]
    end

    return result
end