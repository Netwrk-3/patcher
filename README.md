## What is Patcher
This is a command-line utility for scanning a Linux kernel for vulnerabilities, freeing up disk space, and performing other essential system administration tasks.

## Getting started
To get started with patcher you need to install it first. For that you need to choose a branch from which you're going to download the patcher executable.
We have the stable branch which is updated by our team frequently.

## Installing Patcher
To install patcher you need yo choose if you want the latest stable release or the latest beta release. We recomend using the stable release for most people. 

```bash
# Clone into our Github repositoty via git
git clone https://github.com/Netwrk-3/patcher.git
# go into the cloned repo.
cd patcher
# Check the SHA-256 sum of the file (Ideal output: install.bash: OK)
echo 590103830b9a4c3ae4ae3320fce41cf458dc8e2ea0f31ceaf7d113cf0255edba install.bash | sha256sum -c 
# Give the installer script executable permission
chmod +x ./install.bash 
# Run the installation script with root privilages using sudo (same can be done using doas or pkexec)
sudo ./install.bash
```

# Some of our recomended kernels

* For servers with newer hardware (5-6 months old hardware): 5.15.x series (Check https://kernel.org)
* For routers and simmilar devices: 4.14.x series or 4.9.x series (Check https://kernel.org)
* For performence critical systems (has good stability and support for newer hardware): Liqourix (Recomended for newer hardware, gives better perofmence)  or Xanmod LTS (good performence and great stability)

***Note: All these kernels have been tested by us and we have also checked their respective source codes for vulnebilities.***

## FAQs
<details>
<summary>How does the release cycle of patcher work ?</summary>
<br>
Patcher's release cycle has three main brachnes. The stable branch, the testing branch and the beta branch. The beta branch is where new feautres are added to patcher and they are worked on. The beta branch's code has some bugs which get's patched in the testing branch. In the testing the code from the beta branch gets edited to make if faster and more lightweight. We aslo try patcher on different architectures and also on different distros before releasing it to the stable brach. We recomend you to use the stable version of patcher to avoid errors and bugs.
<br><br>
<pre>
Question asked at 16:33 UTC 23 April 2022
</pre>
</details>

---

<details open>
<summary>How to contribute to patcher</summary>
<br>
You can contribute code to patcher from our github repository at https://github.com/Netwrk-3/patcher
<br><br>
<pre>
Question asked at 13:56 IST 22 April 2022
</pre>
</details>
