# sks147.github.io

## Steps followed
brew update
brew install ruby-build
rbenv install --list
rbenv install 2.6.0
rbenv global 2.6.0
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zsh_profile
source ~/.zsh_profile
rbenv global 2.6.0
ruby -v
gem -v
make -v
gcc -v
g++ -v
 
gem env
code ~/.zshrc
add line : export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
source ~/.zshrc

cd sks147.github.io
gem install --user-install bundler jekyll

jekyll new . --force
code .
git status
git add .
git commit -m "Initialize jekyll"
git push
bundle lock --add-platform ruby
bundle lock --add-platform x86_64-linux

To run locally
bundle exec jekyll serve

Runs at Server address: http://127.0.0.1:4000/