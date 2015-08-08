## cpwd 1.4 — tiny and handy password manager

cpwd is simple, stateless password manager. You enter a master key and the name of an account (ex. "gmail"), wait a few seconds, and cpwd generates a password for that account ready in your clipboard. You can reuse the same master key for all your accounts, and cpwd will generate a different strong password for every account. Every time you want to log in, just launch cpwd and enter the same master key and account name. Simple! Useful!

cpwd is a C port of [npwd] (https://github.com/kaepora/npwd) by [Nadim Kobeissi] (https://nadim.computer).

### Benefits
1. Memorize a single master key, but still get a different strong password for every account.
2. Quick and easy command-line access.
3. Copies password straight to clipboard then clears clipboard automatically in 15 seconds.
4. Doesn't store anything: no password databases to manage.

### Usage
1. Run `cpwd [-r] [%account_name%]`, ex. `cpwd`, `cpwd twitter`, `cpwd -r`, `cpwd -r reddit`. Adding `-r` allows you to run cpwd in registration mode where you need to enter master key twice to avoid errors. It's very useful when you're registering or changing password somewhere. Adding `%account_name%` allows you to skip entering account name in dialog mode.
2. Enter your master key (hidden, same for all accounts).
3. In a few seconds, your password for that account is in your clipboard. Clipboard is cleared automatically after 15 seconds for security.

### Notes
1. **Weak master key ruins everything**. Your master key should have at least 8 characters, contain lowercase and uppercase letters, numbers and special symbols.
2. cpwd is compatibile with latest npwd 1.0.6 and offers the same functional plus some new. cpwd allows you to get maximum speed of work while npwd is much easier to install. cpwd is written in C while npwd is written in JavaScript, thus depends on `Node.JS` and `npm`.
3. Key derivation is done with [scrypt] (https://www.tarsnap.com/scrypt.html), account name acts as salt. Parameters: N = 2<sup>17</sup> = 131072, r = 8, p = 1, L = 16. Generated passwords contain 32 symbols from 0123456789abcdef set.
4. Account names are lowercased automatically for usability. "GitHub" == "github".

### Platforms
* Linux (tested)
* OpenBSD, Windows, Mac OS X (not tested, but probably supported)
* other OSes (you may need to do some porting work)

### Installation
1. `git clone https://github.com/postboy/cpwd.git` to download repository.
2. Build cpwd. On *nix systems with GCC you can do it via running `build.sh` script.
3. Linux/OpenBSD only: install `xclip` package for working with clipboard (you can use `xsel` package aswell, just edit the main.c for a bit).

### Tips on cpwd launching speed-up
1. On *nix: add a lines `alias p='/path/to/./cpwd'` and `alias r='/path/to/./cpwd -r'` in your `.bashrc` file for adding two commands to your shell: `p` that launches cpwd in normal mode and add `r` that launches cpwd in registration mode.
2. On Windows: for faster launching cpwd via `p` and `r` commands in cmd you can create two batch scripts in some directory that's shown as result of `PATH` command in cmd: `p.bat` containing a line `@echo off && 'C:\path\to\cpwd.exe'` and `r.bat` containing a line `@echo off && 'C:\path\to\cpwd.exe -r'`.

### Tips on cpwd computing speed-up
1. Check if your processor supports SSE (on *nix just run `grep sse /proc/cpuinfo` to do it). If it does, compile against crypto_scrypt-sse.c instead of crypto_scrypt-nosse.c (and if you use GCC, add a flag `-march=native`).
2. Enable optimization in your compiler. If you use GCC, you can do it with flags `-march=native` (compile just for current processor) plus `-O1` or `-O2` or `-O3` (test them all and use the best for you).

### See also
1. [npwd] (https://github.com/kaepora/npwd) — imagine cpwd with very easy installation, but maybe not that fast work :)
2. [PwdHash] (https://www.pwdhash.com) has a similar idea but uses hashing instead of key derivation function, thus [dramatically less secure] (https://security.stackexchange.com/questions/52355/how-secure-is-the-pwdhash-algorithm-and-system).
3. [Password manager without a password manager] (https://gist.github.com/jaseg/3334991) had a somewhat similar idea, used hashing instead of key derivation function and was broken.

### License
cpwd itself is licensed under [GPL v3] (https://www.gnu.org/licenses/gpl-3.0.en.html), but uses parts of [scrypt 1.1.6] (https://www.tarsnap.com/scrypt.html) licensed under [BSD 2-Clause] (http://opensource.org/licenses/bsd-license.php) and [GCC Poison] (http://blog.leafsr.com/2013/12/02/gcc-poison) which is public domain.

### Author
Zuboff Ivan // anotherdiskmag on gooooooogle mail
