return {
  'codethread/qmk.nvim',
  config = function()
    ---@type qmk.UserConfig
    local conf = {
      name = 'LAYOUT',
      auto_format_pattern = 'fakefile.c',
      layout = {
        -- Kyria
        'x x x x x x _ x _ x _ x x x x x x',
        'x x x x x x _ x _ x _ x x x x x x',
        'x x x x x x _ x _ x _ x x x x x x',
        'x x x x x x x x _ x x x x x x x x',
        '_ _ _ x x x x x _ x x x x x _ _ _',
        --'x x x x _ x _ _ _ x x x x _ x _ _',
      },
    }
    require('qmk').setup(conf)
  end,
}
--* |  Esc   |   1  |   2  |   3  |   4  |   5  |      |LShift|  |RShift|      |   6  |   7  |   8  |   9  |   0  |  Esc   |
--* |--------+------+------+------+------+------|      |------|  |------|      |------+------+------+------+------+--------|
--* |  Tab   |   Q  |   W  |   E  |   R  |   T  |      |LCtrl |  | RCtrl|      |   Y  |   U  |   I  |   O  |   P  |  Bksp  |
--* |--------+------+------+------+------+------|      |------|  |------|      |------+------+------+------+------+--------|
--* |Ctrl/Esc|   A  |   S  |   D  |   F  |   G  |      | LAlt |  | RAlt |      |   H  |   J  |   K  |   L  | ;  : |Ctrl/' "|
--* |--------+------+------+------+------+------+------+------|  |------|------+------+------+------+------+------+--------|
--* | LShift |   Z  |   X  |   C  |   V  |   B  | [ {  |CapsLk|  |F-keys|  ] } |   N  |   M  | ,  < | . >  | /  ? | RShift |
--* `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
--*                        |Adjust| LGUI | LAlt/| Space| Nav  |  | Sym  | Space| AltGr| RGUI | Menu |
--*                        |      |      | Enter|      |      |  |      |      |      |      |      |
--*                        `----------------------------------'  `----------------------------------'
--*
--* ,----------------------------.      ,------.                 ,----------------------------.      ,------.
--* | Prev | Next | Pause | Stop |      | Mute |                 | Prev | Next | Pause | Stop |      | Mute |

-- ZodiarkPi
--   'x x x x x x _ _ _ _ x x x x x x',
--   'x x x x x x _ _ _ _ x x x x x x',
--   'x x x x x x x x x x x x x x x x',
--   'x x x x x x x x x x x x x x x x',
--   'x x x x x _ x x x x _ x x x x x',
--
-- Kyria
--   'x x x x x x _ _ _ _ x x x x x x',
--   'x x x x x x _ _ _ _ x x x x x x',
--   'x x x x x x x x x x x x x x x x',
--   '_ _ _ x x x x x x x x x x _ _ _',
