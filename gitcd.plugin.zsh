gitcd() {
    url=$1
    gitcd_home=${GITCD_HOME:-"${HOME}/Code"}

    mkdir -p -- "${gitcd_home}"

    if [[ ${url} == "" ]]; then
        cd -- "${gitcd_home}" || return
        return
    fi

    dir=$(_gitcd_giturl2dir "${url}")

    if [[ -n ${GITCD_TRIM} ]]; then
        dir=${dir##*\/}  # "github.com/foo/bar" ==> "bar"
    fi

    target="${gitcd_home}/${dir}"

    if [[ ! -d ${target} ]]; then
        git clone -- "${url}" "${target}"
    fi

    cd -- "${target}" || return
}

_gitcd_giturl2dir() {
    # reference: https://github.com/repo-utils/giturl/blob/master/lib/giturl.js

    url=$1
    url=${url#*@}     # "git@"             ==> ""
                      # "https://jpillora@" => ""

    url=${url#*://}   # "git://"       ==> ""
                      # "git+https://" ==> ""

    url=${url%.git*}  # ".git" => ""

    url=${url/:/\/}   # "github.com:foo/bar" ==> "github.com/foo/bar"

    echo "${url}"
}
