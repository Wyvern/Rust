
export RUSTUP_HOME=/opt/Rust/.rustup
export CARGO_HOME=/opt/Rust/.cargo

alias l='ls -AhGx'
alias ll='ls -AhlG'
alias grep='grep --color=always'
alias gc='git clone --depth=1 --no-single-branch'
alias diff='diff --color=always'
alias daily='rustup update; brew update && brew upgrade; brew autoremove; rdf;'
alias rdf='echo [ "\x1b[93m"rustc -Z"\x1b[0m" ]"\n"; rustc -Z help|diff ~/Desktop/Rust/rz.txt -; echo [ "\x1b[93m"rustc -C"\x1b[0m" ]"\n"; rustc -C help|diff ~/Desktop/Rust/rc.txt -; echo [ "\x1b[93m"cargo -Z"\x1b[0m" ]"\n"; cargo -Z help|diff ~/Desktop/Rust/cz.txt -;echo [ "\x1b[93m"target list"\x1b[0m" ]"\n"; rustc --print target-list|diff ~/Desktop/Rust/target.txt -'
alias rt='cargo clean && cargo b'
alias rla='rustc -Cllvm-args=--help|grep -i'
alias rdd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias rz='rustc -Z help|grep -i'
alias rc='rustc -C help|grep -i'
alias cz='cargo -Z help|grep -i'
alias rv='rustup -V; cargo -Vv; rustc -Vv'
alias gi='grep -ie'
alias pn='ps -alxmrh|gi'
alias curl='curl --tcp-fastopen --tcp-nodelay -#fSLA "Mozilla Firefox/Edge/Chrome" '
alias cm='git commit --allow-empty --allow-empty-message -am" "'
alias fad='find /Library/LaunchAgents /System/Library/LaunchAgents/ /Library/LaunchDaemons/ /System/Library/LaunchDaemons/ -iname "*"|grep -i'

alias ze='zig build-exe -dynamic -OReleaseSmall --gc-sections -fstrip -dead_strip -fno-unwind-tables -fomit-frame-pointer -mno-red-zone -fno-reference-trace -fno-error-tracing -z nocopyreloc -mcpu=native'
alias zf='zig build-exe -OReleaseFast --gc-sections -fstrip -dead_strip -fno-unwind-tables -fomit-frame-pointer -mno-red-zone -fno-reference-trace -fno-error-tracing -fno-stack-check -z nocopyreloc -mcpu=native'
alias zl='zig build-lib -dynamic -OReleaseSmall --gc-sections -fstrip -dead_strip -fno-unwind-tables -fomit-frame-pointer -mno-red-zone -fno-reference-trace -fno-error-tracing -z nocopyreloc -mcpu=native'
alias zr='zig run -dynamic -OReleaseSmall --gc-sections -fstrip -dead_strip -fno-unwind-tables -fomit-frame-pointer -mno-red-zone -fno-reference-trace -fno-error-tracing -z nocopyreloc -mcpu=native'
alias zs='zig run -dynamic -OReleaseSafe --gc-sections -fstrip -dead_strip -fno-unwind-tables -fomit-frame-pointer -mno-red-zone -fno-reference-trace -fno-error-tracing -z nocopyreloc -mcpu=native'

alias target='rustc --print host-tuple'
alias targets='rustc --print target-list'
alias ti='targets | gi'
alias cpu='rustc --print target-cpus'
alias feature='rustc --print target-features'
alias tsj='rustc -Z unstable-options --print target-spec-json --target'
alias cfg='rustc --print cfg --target'
alias gb='go build -ldflags="-s -w -buildid= -linkmode=external -extldflags "-Wl,--gc-sections,--strip-all""'

function tier(){
    local want_tier="${2:-}"
    for t in $(targets | grep --color=never -ie "$1"); do
        tier=$(tsj "$t" 2>/dev/null |
                    jq -r --argjson want "${want_tier:-null}" '
                        if $want == null then
                            .metadata.tier // "unknown"
                        else
                            if (.metadata.tier == $want) then
                                .metadata.tier
                            else
                                empty
                            end
                        end
                    ')
                [[ -z "$tier" ]] && continue
        printf "%-50s tier-%s\n" "$t" "$tier";
    done
}

function zt() {
    if [ $# -eq 0 ];then
        echo "Please input a test file: '<file.zig>'".
        return
    fi

    local target="$1"
    shift
    filter=""

    for arg in "$@"; do
        filter+="--test-filter \"$arg\" "
    done

    eval "zig test -dynamic -OReleaseSmall --gc-sections -fstrip -fno-unwind-tables -fomit-frame-pointer -mno-red-zone -fno-reference-trace -z nocopyreloc -mcpu=native $target $filter"
}
. "/opt/Rust/.cargo/env"
