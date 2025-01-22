# ReconVPS
This repository provides a comprehensive guide to setting up a virtual private server (VPS) optimized for the reconnaissance phase of bug bounty hunting. It includes detailed instructions for installing essential tools, configuring the environment, and preparing the system for efficient data gathering and analysis. From setting up Go-based tools to installing utilities like Masscan and Subfinder, this repository ensures you have a streamlined and powerful workspace ready for reconnaissance tasks.

## Auto Installation

```bash
git clone https://github.com/hunThubSpace/ReconVPS.git; cd ReconVPS; bash reconVPS.sh
```

## Manual Installation
1. **Operating System:**  
   This guide assumes you're using **Ubuntu Server 22.04** on a Virtual Private Server (VPS).

2. **Update & Upgrade VPS Packages:**

    ```sh
    sudo apt update && sudo apt upgrade -y
    ```

3. **Root User Preference:**  
   I prefer to operate as the **root** user, so I log into my VPS as root and avoid using `sudo` for installations and operations.

4. **Install Essential Tools:**  
   Install the minimum required tools, as some applications depend on these packages:

    ```sh
    sudo apt install -y git vim curl zsh net-tools tmux make jq unzip postgresql-client crunch gcc python3-apt libssl-dev build-essential libpcap-dev
    ```

5. **Install pip3 (Python Package Manager):**

    ```sh
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --break-system-packages
    rm get-pip.py
    ```

6. **Install ZSH & Oh My Zsh:**  
   Since I use **ZSH** with **Oh My Zsh**, let's install **OMZ**:

    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

7. **Install Sourcegraph CLI (src):**  
   To use **Sourcegraph**, install the `src` CLI:

    ```sh
    curl -s -L https://sourcegraph.com/.api/src-cli/src_linux_amd64 -o /usr/local/bin/src
    chmod +x /usr/local/bin/src
    ```

8. **Install GoLang (Go):**  
   Since most applications I use are developed with **Go**, install the latest version:

    ```sh
    wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz
    rm -rf /usr/local/go
    tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz
    rm go1.23.1.linux-amd64.tar.gz
    ```

    Add Go to the system's path by appending this to your `~/.zshrc`:

    ```sh
    export PATH=$PATH:/usr/local/go/bin
    ```

    Apply changes:

    ```sh
    source ~/.zshrc
    ```

    Verify the installation:

    ```sh
    go version
    ```

9. **Install Go Tools:**  
    Install additional tools using Go:

    ```sh
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go install -v github.com/ffuf/ffuf/v2@latest
    go install -v github.com/tomnomnom/unfurl@latest
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install -v github.com/bp0lr/gauplus@latest
    go install -v github.com/projectdiscovery/katana/cmd/katana@latest
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install -v github.com/tomnomnom/anew@latest
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
    go install -v github.com/projectdiscovery/cdncheck/cmd/cdncheck@latest
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install -v github.com/hakluke/hakip2host@latest
    go install -v github.com/d3mondev/puredns/v2@latest
    ```

    Add the Go binary path to your `~/.zshrc`:

    ```sh
    export PATH=$PATH:/root/go/bin
    ```

    Apply changes:

    ```sh
    source ~/.zshrc
    ```

10. **Install Other Tools (Massdns, Dnsgen, Altdns, Masscan):**

    ```sh
    mkdir -p /opt/{others,wordlists}
    ```

    Add the `/opt/others` directory to the system path by adding the following to your `~/.zshrc`:

    ```sh
    export PATH=$PATH:/opt/others
    ```

    Apply changes:

    ```sh
    source ~/.zshrc
    ```

    - **Massdns:**

      ```sh
      cd /opt/others
      git clone https://github.com/blechschmidt/massdns.git massdns_dic
      cd massdns_dic
      make
      make install
      mv bin/massdns /opt/others
      rm -rf ../massdns_dic
      ```

    - **Dnsgen:**

      ```sh
      python3 -m pip install dnsgen --break-system-packages
      ```

    - **Altdns:**

      ```sh
      pip3 install py-altdns --break-system-packages
      ```

    - **Masscan:**

      ```sh
      cd /opt/others
      git clone https://github.com/robertdavidgraham/masscan masscan_dic
      cd masscan_dic
      make
      make install
      mv bin/masscan /opt/others
      rm -rf ../masscan_dic
      ```

11. **Update `~/.zshrc`:**  
    Replace your **~/.zshrc** file with the following content:

    ```sh
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="robbyrussell"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh

    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:/root/go/bin
    export PATH=$PATH:/opt/others
    ```

12. **Apply `~/.zshrc` Changes:**  
    Save the file and apply the changes:

    ```sh
    source ~/.zshrc
    ```
