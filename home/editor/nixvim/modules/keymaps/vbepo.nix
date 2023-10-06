{
  programs.nixvim.keymaps = [
    { options.desc = "mot"; key = "é"; action = "w"; }
    { options.desc = "MOT"; key = "É"; action = "W"; }

    { options.desc = ""; mode = "o"; key = "aé"; action = "aw"; }
    { options.desc = ""; mode = "o"; key = "aÉ"; action = "aW"; }
    { options.desc = ""; mode = "o"; key = "ié"; action = "iw"; }
    { options.desc = ""; mode = "o"; key = "iÉ"; action = "aW"; }

    
    { options.desc = "gauche"; key = "t"; action = "h"; }
    { options.desc = "droite"; key = "n"; action = "l"; }

    { options.desc = "bas"; key = "s"; action = "j"; }
    { options.desc = "haut"; key = "r"; action = "k"; }


    { options.desc = "Haut de l'écran"; key = "T"; action = "H"; }
    { options.desc = "Bas de l'écran"; key = "N"; action = "L"; }
    { options.desc = "Joindre"; key = "S"; action = "J"; }
    { options.desc = "Aide"; key = "R"; action = "K"; } # Aide

    { options.desc = "Repli suivant"; key = "zr"; action = "zj"; }
    { options.desc = "Repli précédant"; key = "zs"; action = "zk"; }


    { options.desc = "Jusqu'à"; key = "j"; action = "t"; }
    { options.desc = "Jusqu'à arrière"; key = "J"; action = "T"; }

    { options.desc = "Recherche suivante"; key = "l"; action = "n"; }
    { options.desc = "Recherche précédante"; key = "L"; action = "N"; }

    { options.desc = "Substituer char"; key = "k"; action = "s"; } # Delete x char et mode insert 
    { options.desc = "Substituer ligne"; key = "K"; action = "S"; } # Delete x line et mode inserte

    { options.desc = "Remplacer char"; key = "h"; action = "r"; } # Remplace carac sous curseur
    { options.desc = "Mode remplacement"; key = "H"; action = "R"; } # Entre dans le mode de remplacement

    { options.desc = ""; key = "[k"; action = "]s"; } # Remplace carac sous curseur
    { options.desc = ""; key = "]k"; action = "[s"; } # Entre dans le mode de remplacement

    { options.desc = ""; key = "gs"; action = "gk"; } # ligne écran précédant
    { options.desc = ""; key = "gr"; action = "gj"; } # linge écrant suivant 

    { options.desc = ""; key = "gb"; action = "gT"; } # onglet précédent
    { options.desc = ""; key = "gé"; action = "gt"; } # onglet suivant

    { options.desc = ""; key = "gB"; action = ":exe \"silent! tabfirst\"<CR>"; } # premier onglet
    { options.desc = ""; key = "gÉ"; action = ":exe \"silent! tablast\"<CR>"; } # deuxième onglet

    { options.desc = ""; key = "<leader>t"; action  = "<C-w>h"; } # fenêtre  gauche
    { options.desc = ""; key = "<leader>n"; action  = "<C-w>l"; } # fenetre droite
    { options.desc = ""; key = "<leader>s"; action  = "<C-w>j"; } # fenêtre bas
    { options.desc = ""; key = "<leader>r"; action  = "<C-w>k"; } # fenêtre haut
    { options.desc = ""; key = "<leader>q"; action  = "<C-w>c"; } # Fermer la fenêtre actuelle
    { options.desc = ""; key = "<leader>h"; action  = "<C-w>s"; } # Scinder la fenêtre
    { options.desc = ""; key = "<leader>v"; action  = "<C-w>v"; } # Scinder verticalement

    { options.desc = ""; key = "0"; action  = "*"; }
    { options.desc = ""; key = "*"; action  = "0"; }
    { options.desc = ""; key = "\""; action  = "1"; }
    { options.desc = ""; key = "1"; action  = "\""; }
    { options.desc = ""; key = "«"; action  = "2"; }
    { options.desc = ""; key = "2"; action  = "«"; }
    { options.desc = ""; key = "»"; action  = "3"; }
    { options.desc = ""; key = "3"; action  = "»"; }
    { options.desc = ""; key = "("; action  = "4"; }
    { options.desc = ""; key = "4"; action  = "("; }
    { options.desc = ""; key = ")"; action  = "5"; }
    { options.desc = ""; key = "5"; action  = ")"; }
    { options.desc = ""; key = "@"; action  = "6"; }
    { options.desc = ""; key = "6"; action  = "@"; }
    { options.desc = ""; key = "+"; action  = "7"; }
    { options.desc = ""; key = "7"; action  = "+"; }
    { options.desc = ""; key = "-"; action  = "8"; }
    { options.desc = ""; key = "8"; action  = "-"; }
    { options.desc = ""; key = "/"; action  = "9"; }
    { options.desc = ""; key = "9"; action  = "/"; }
  ];
}
