{
  programs.nixvim.maps = {
		operator = {
			"aé" = "aW";
    	"aÉ" = "aW";
    	"ié" = "iW";
    	"iÉ" = "iW";
		};

		normalVisualOp = {
			"é" = "w";
			"É" = "W";

			"t" = "h"; # cursor right
    	"n" = "l"; # cursor left
    	"s" = "j"; # cursor dowm
    	"r" = "k"; # cursor up

    	"T" = "H";
    	"N" = "L";
    	"S" = "J";
    	"R" = "K";

    	"zr" = "zj";
    	"zs" = "zk";

    	"j" = "t";
    	"J" = "T";

    	"l" = "n";
    	"L" = "N";

    	"h" = "r";
    	"H" = "R";

    	"k" = "s";
    	"K" = "S";

    	"]k" = "]s";
    	"[k" = "[s";

    	"gs" = "gk";
    	"gr" = "gj";

    	"gb" = "gT";
    	"gé" = "gt";

    	"gB" = ":exe \"silent! tabfirst\"<CR>";
    	"gÉ" = ":exe \"silent! tablast\"<CR>";

    	"<C-s>" = "<C-w>j";
    	"<C-r>" = "<C-w>k";
    	"<C-t>" = "<C-w>h";
    	"<C-n>" = "<C-w>l";
    	"<C-c>" = "<C-w>c";
    	"<C-h>" = "<C-w>s";
    	"<C-g>" = "<C-w>v";

    	"0" = "*";
    	"*" = "0";
    	"\"" = "1";
    	"1" = "\"";
    	"«" = "2";
    	"2" = "«";
    	"»" = "3";
    	"3" = "»";
    	"(" = "4";
    	"4" = "(";
    	")" = "5";
    	"5" = ")";
    	"@" = "6";
    	"6" = "@";
    	"+" = "7";
    	"7" = "+";
    	"-" = "8";
    	"8" = "-";
    	"/" = "9";
    	"9" = "/";
		};
	};    
}
