. "/opt/Rust/.cargo/env"

export RUSTUP_HOME=/opt/Rust/.rustup
export CARGO_HOME=/opt/Rust/.cargo
export HOMEBREW_NO_AUTO_UPDATE
export PYTHON_JIT=1

alias l='ls -AhGx'
alias ll='ls -AhlG'
alias grep='grep --color=always'
alias gc='git clone --filter=tree:0 --depth=1'
alias gf='git fetch --filter=tree:0 --depth=1'
alias diff='diff --color=always'
alias daily='rustup update; brew upgrade; brew autoremove; brew cleanup; rdf;'
alias rdf='echo --- "\x1b[4m" rustc -Z "\x1b[0m" ---"\n" ; rustc -Z help|diff ~/Desktop/rz.txt -; echo --- "\x1b[4m" rustc -C "\x1b[0m" ---"\n" ; rustc -C help|diff ~/Desktop/rc.txt -; echo --- "\x1b[4m" cargo -Z "\x1b[0m" ---"\n" ; cargo -Z help|diff ~/Desktop/cargo.txt -'
alias rt='cargo clean && cargo b'
alias rla='rustc -Cllvm-args=--help|grep -i'
alias rdd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias rz='rustc -Z help|grep -i'
alias rc='rustc -C help|grep -i'
alias cz='cargo -Z help|grep -i'
alias rv='rustup -V; cargo -Vv; rustc -Vv'
alias gi='grep -i'
alias pn='ps -alxmrh|gi'
alias curl='curl --tcp-fastopen --tcp-nodelay -fSLA "Mozilla Firefox/Edge/Chrome" '
alias cm='git commit --allow-empty --allow-empty-message -am" "'
alias fad='find /System/Library/LaunchAgents/ /System/Library/LaunchDaemons/ -iname "*"|grep -i'
alias zs='zig build-exe -dynamic -OReleaseSmall --gc-sections -fno-compiler-rt -fstrip -fno-unwind-tables -fomit-frame-pointer -fno-formatted-panics -mno-red-zone -fno-reference-trace -fPIE -fPIC'
alias zf='zig build-exe -dynamic -OReleaseFast --gc-sections -fno-compiler-rt -fstrip -fno-unwind-tables -fomit-frame-pointer -fno-formatted-panics -mno-red-zone -fno-reference-trace -fPIE -fPIC'
alias zl='zig build-lib -dynamic -OReleaseSmall --gc-sections -fno-compiler-rt -fstrip -fno-unwind-tables -fomit-frame-pointer -fno-formatted-panics -mno-red-zone -fno-reference-trace -fPIC'
alias zr='zig run -dynamic -OReleaseSmall --gc-sections -fno-compiler-rt -fstrip -fno-unwind-tables -fomit-frame-pointer -fno-formatted-panics -mno-red-zone -fno-reference-trace -fPIE -fPIC'

alias target='rustc -vV | grep -i host | cut -d: -f2'
alias ti='rustc --print target-list|gi '
alias cpu='rustc --print target-cpus --target '
alias feature='rustc --print target-features --target'
