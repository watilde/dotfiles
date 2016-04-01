## package manager
source  ~/.fish/package.fish

## Load inits files
for file in ~/.fish/inits/*.fish
    source $file
end
