#! /bin/bash

# Define color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

echo -e "${GREEN}[+] Update & Upgrade VPS Packages${RESET}"
echo -e "${BLUE}[*] > sudo apt update && sudo apt -y upgrade ${RESET}"
sudo apt update && sudo apt -y upgrade
# ------------------------------------------------------
echo -e "${GREEN}[+] Install requrement tools - part 1 ${RESET}"
echo -e "${BLUE}[*] > sudo apt install -y git vim curl zsh net-tools tmux make jq unzip zip crunch gcc ${RESET}"
sudo apt install -y git vim curl zsh net-tools tmux make jq unzip zip crunch gcc
# ------------------------------------------------------
echo -e "${GREEN}[+] Install requrement tools - part 2 ${RESET}"
echo -e "${BLUE}[*] > sudo apt install -y postgresql-client python3-apt libssl-dev build-essential libpcap-dev ${RESET}"
sudo apt install -y postgresql-client python3-apt libssl-dev build-essential libpcap-dev -y
# ------------------------------------------------------
echo -e "${GREEN}[+] Installing pip3${RESET}"
echo -e "${BLUE}[*] > curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py; python3 get-pip.py --break-system-packages; rm get-pip.py ${RESET}"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py; python3 get-pip.py --break-system-packages; rm get-pip.py
# ------------------------------------------------------
echo -e "${GREEN}[+] Installing OMZ${RESET}"
echo -e "${BLUE}[*] > echo Y | sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" ${RESET}"
echo Y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ------------------------------------------------------
echo -e "${GREEN}[+] Update ~/.zshrc${RESET}"
echo -e "${BLUE}[*] > cp ~/.zshrc ~/.zshrc_backup ${RESET}"
cp ~/.zshrc ~/.zshrc_backup
echo -e "${BLUE}[*] > echo export ZSH=\"\$HOME/.oh-my-zsh\" > ~/.zshrc ${RESET}"
echo export ZSH="\$HOME/.oh-my-zsh" > ~/.zshrc
echo -e "${BLUE}[*] > echo ZSH_THEME=\"robbyrussell\" >> ~/.zshrc ${RESET}"
echo ZSH_THEME="robbyrussell" >> ~/.zshrc
echo -e "${BLUE}[*] > echo source \$ZSH/oh-my-zsh.sh >> ~/.zshrc ${RESET}"
echo source \$ZSH/oh-my-zsh.sh >> ~/.zshrc
echo -e "${BLUE}[*] > echo export PATH=\$PATH:/root/go/bin >> ~/.zshrc ${RESET}"
echo export PATH=\$PATH:/root/go/bin >> ~/.zshrc
echo -e "${BLUE}[*] > echo export PATH=\$PATH:/opt/others >> ~/.zshrc ${RESET}"
echo export PATH=\$PATH:/opt/others >> ~/.zshrc
echo -e "${BLUE}[*] > source ~/.zshrc ${RESET}"
source ~/.zshrc
# ------------------------------------------------------
echo -e "${GREEN}[+] Installing Sourcegraph ${RESET}"
echo -e "${BLUE}[*] > curl -s -L https://sourcegraph.com/.api/src-cli/src_linux_amd64 -o /usr/local/bin/src; chmod +x /usr/local/bin/src ${RESET}"
curl -s -L https://sourcegraph.com/.api/src-cli/src_linux_amd64 -o /usr/local/bin/src; chmod +x /usr/local/bin/src
# ------------------------------------------------------
echo -e "${GREEN}[+] Installing Golang from source${RESET}"
echo -e "${BLUE}[*] > wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz; rm -rf /usr/local/go; tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz; rm go1.23.1.linux-amd64.tar.gz ${RESET}"
wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz; rm -rf /usr/local/go; tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz; rm go1.23.1.linux-amd64.tar.gz
# ------------------------------------------------------
echo -e "${GREEN}[+] Installing Go tools${RESET}"
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/notify/cmd/notify@latest ${RESET}"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest ${RESET}"
go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
echo -e "${BLUE}[*] > go install -v github.com/ffuf/ffuf/v2@latest ${RESET}"
go install -v github.com/ffuf/ffuf/v2@latest
echo -e "${BLUE}[*] > go install -v github.com/tomnomnom/unfurl@latest ${RESET}"
go install -v github.com/tomnomnom/unfurl@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest ${RESET}"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo -e "${BLUE}[*] > go install -v github.com/bp0lr/gauplus@latest ${RESET}"
go install -v github.com/bp0lr/gauplus@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/katana/cmd/katana@latest ${RESET}"
go install -v github.com/projectdiscovery/katana/cmd/katana@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest ${RESET}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest ${RESET}"
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest ${RESET}"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
echo -e "${BLUE}[*] > go install -v github.com/tomnomnom/anew@latest ${RESET}"
go install -v github.com/tomnomnom/anew@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest ${RESET}"
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/cdncheck/cmd/cdncheck@latest ${RESET}"
go install -v github.com/projectdiscovery/cdncheck/cmd/cdncheck@latest
echo -e "${BLUE}[*] > go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest ${RESET}"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo -e "${BLUE}[*] > go install -v github.com/hakluke/hakip2host@latest ${RESET}"
go install -v github.com/hakluke/hakip2host@latest
echo -e "${BLUE}[*] > go install -v github.com/d3mondev/puredns/v2@latest ${RESET}"
go install -v github.com/d3mondev/puredns/v2@latest
echo -e "${BLUE}[*] > go install -v github.com/tomnomnom/assetfinder@latest ${RESET}"
go install -v github.com/tomnomnom/assetfinder@latest
# ------------------------------------------------------
echo -e "${GREEN}[+] Installing other tools ${RESET}"
echo -e "${BLUE}[*] > mkdir -p /opt/{others,wordlists} ${RESET}"
mkdir -p /opt/{others,wordlists}
echo -e "${BLUE}[*] > cd /opt/others; git clone https://github.com/blechschmidt/massdns.git massdns_dic; cd massdns_dic; make; make install; mv bin/massdns /opt/others; rm -rf ../massdns_dic; cd ~ ${RESET}"
cd /opt/others; git clone https://github.com/blechschmidt/massdns.git massdns_dic; cd massdns_dic; make; make install; mv bin/massdns /opt/others; rm -rf ../massdns_dic; cd ~
echo -e "${BLUE}[*] > python3 -m pip install dnsgen --break-system-packages ${RESET}"
python3 -m pip install dnsgen --break-system-packages
echo -e "${BLUE}[*] > pip3 install py-altdns --break-system-packages ${RESET}"
pip3 install py-altdns --break-system-packages
echo -e "${BLUE}[*] > cd /opt/others; git clone https://github.com/robertdavidgraham/masscan masscan_dic; cd masscan_dic; make; make install; mv bin/masscan /opt/others; rm -rf ../masscan_dic ${RESET}"
cd /opt/others; git clone https://github.com/robertdavidgraham/masscan masscan_dic; cd masscan_dic; make; make install; mv bin/masscan /opt/others; rm -rf ../masscan_dic
# ------------------------------------------------------
echo -e "${GREEN}[+] FINISHED ${RESET}"
