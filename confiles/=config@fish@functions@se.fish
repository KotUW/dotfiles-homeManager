#!/usr/bin/env fish

function _get_query
    if test (count $argv) -lt 1
        set -f input (gum input --placeholder "Search term" --prompt "? ")
    else
        set -f input (string join '+' $argv)
    end
    echo (string replace -a " " "+" $input)

    functions -e _get_query
end

function se -d "Search ddg, opens firefox with your search term"
    if test (count $argv) -lt 1
        set -f input (gum input --placeholder "Search term" --prompt "? ")
    else
        set -f input (string join '+' $argv)
    end
    set -l query (string replace -a " " "+" $input)

    firefox-dev "https://duckduckgo.com?q="$query & disown
end

function ai -d "Search ddg, opens firefox with your search term"
    if test (count $argv) -lt 1
        set -f input (gum input --placeholder "Search term" --prompt "? ")
    else
        set -f input (string join '+' $argv)
    end
    set -l query (string replace -a " " "+" $input)

    firefox-dev "https://duckduckgo.com?q=!chat+"$query & disown
end
