## What is Patcher

Patcher is a Linux system maintenance and Security tool designed to make system maintenance tasks easier. Such as finding vulnebilities in the    Linux kernel verison you are currently using and patching them. Deleting useless files to free up disk space and more. It's a free and opensource tool published under the GNU GPL v3 license.

## Getting started
To get started with patcher you need to install it first. For that you need to choose a branch from which you're going to download the patcher executable.
We have three branches in our Github repository:
1. stable
2. beta (unsupported & not recieving updates)

## Installing Patcher
To install patcher you need yo choose if you want the latest stable release or the latest beta release. We recomend using the stable release for most people. 

Download the patcher executable from the links given above. Once you have your preffered release and downloaded the executeable, then cd into the directry where you have kept the downloaded executable and then run the following command. (You can also do the same by cloning into the Github repository).
```bash
# Clone into our Github repositoty via git
git clone https://github.com/Netwrk-3/patcher.git
# go into the cloned repo.
cd patcher
# Give the installer script executable permission
chmod +x ./install.bash
# Run the installation script with root privilages using sudo (same can be done using doas or pkexec)
sudo ./install.bash
```

# Some of our recomended kernels

* For servers with newer hardware (5-6 months old hardware): ![source code](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/?h=v5.15.85)
* For routers and simmilar devices: ![source code](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/?h=v4.14.302)
* For performence critical systems (has good stability and support for newer hardware): ![website](https://liquorix.net/)

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
You can contribute code to patcher from our github repository at https://github.com/Emph-Inc/patcher
<br><br>
<pre>
Question asked at 13:56 IST 22 April 2022
</pre>
</details>
