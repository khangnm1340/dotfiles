
# Nushell Config File
#
# version = "0.100.0"

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
let dark_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: { bg: red fg: white }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b }
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

let light_theme = {
    # color for nushell primitives
    separator: dark_gray
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
    # bool: dark_cyan
    bool: dark_cyan
    int: dark_gray
    filesize: cyan_bold
    duration: dark_gray
    date: purple
    range: dark_gray
    float: dark_gray
    string: dark_gray
    nothing: dark_gray
    binary: dark_gray
    cell-path: dark_gray
    row_index: green_bold
    record: dark_gray
    list: dark_gray
    block: dark_gray
    hints: dark_gray
    search_result: { fg: white bg: red }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_purple_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b }
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

    {
      name: copy_pwd
      modifier: control_shift
      keycode: char_z
      mode: [emacs vi_normal vi_insert]
      event: {
        send: executehostcommand,
        cmd: "
          if $env.WAYLAND_DISPLAY? != null {
            pwd | wl-copy
            pwd | notify -i /home/Ext4Pam/Pictures/NewjeansPics/GX2MHKzaYAEAhg_.jpg -s 'copied current directory' -t $in
          } else {
            pwd | notify -i /home/Ext4Pam/Pictures/NewjeansPics/GX2MHKzaYAEAhg_.jpg -s 'cant copy current directory' -t $in
          }
        "
      }
    }

        {
            name: shpool_switch
            modifier: control
            keycode: char_h
            mode: [emacs vi_normal vi_insert]
            event: { 
                send: executehostcommand,
                cmd: "
                    shpool attach ( [1_hanni 2_dani 3_minji 4_haerin 5_hyein] | str join (char nl) | fzf)
                "
            }
        }

# Show "shpool:<name> " when inside a shpool session
let sess_prefix = if 'SHPOOL_SESSION_NAME' in ($env | columns) {
  $"(ansi green)shpool:($env.SHPOOL_SESSION_NAME)(ansi reset) "
} else { "" }

$env.PROMPT_COMMAND = {||
  $"($sess_prefix)($env.PWD) > "
}

      {
            name: fzf_launcher
            modifier: alt
            keycode: char_i
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "fd -E 'in*' -E 'com.zamaudio*' . /usr/share/applications -x basename {} | fzf | gtk-launch $in" }
      }



def sot [ word: string] {
polars open ~/Documents/UTH/MachineLearning/synonyms/thesaurus.parquet 
| polars select pos word synonyms desc
| polars filter ((polars col word) == (polars lit $"($word)"))
| polars collect
}
def so [word: string] {
grep $"^($word)," ~/Documents/UTH/MachineLearning/synonyms/mthesaur.txt
}

def curl-up [ file: string ] {
  curl -v --upload-file $"($file)" $"https://transfer.sh/($file)"
}

def str-wrap [
  --wrap-at: number = 40
] {
  str replace -a "\r\n" "\n"
    | str replace -a "\n" " SINGLENEWLINE "
    | str trim
    | split row -r "\\s+"
    | reduce -f { joined: '' count: 0 } { |word, state|
        if ($word == "\n") {
          {
            joined: ($state.joined + "\n")
            count: 0
          }
        } else if ($state.count < $wrap_at) {
          if ($state.joined | is-empty) {
            {
              joined: $word
              count: ($word | str length)
            }
          } else {
            {
              joined: ($state.joined + ' ' + $word)
              count: ($state.count + 1 + ($word | str length))
            }
          }
        } else {
          {
            joined: ($state.joined + "\n" + $word)
            count: 0
          }
        }
      }
    | get joined
    | str replace -ar "\\s*SINGLENEWLINE\\s*" "\n"
}

def wrap-col [column_name: string] {
    update $"($column_name)" { str-wrap } | table -ed 1
}

