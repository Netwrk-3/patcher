## What is Patcher

Patcher is a Linux system maintenance and Security tool designed to make system maintenance tasks easier. Such as finding vulnebilities in the    Linux kernel verison you are currently using and patching them. Deleting useless files to free up disk space and more. It's free and opensource tool published under the GNU GPL v3 license.

## Getting started
To get started with patcher you need to install it first. For that you need to choose a branch from which you're going to download the patcher executable.
We have three branches in our Github repository:
1. stable
2. testing
3. beta

Download the latest stable releease [here](https://github.com/Emph-Inc/patcher/releases/download/stable-0.1.14/patcher).
Download the beta release [here](https://github.com/Emph-Inc/patcher/releases/download/beta-0.1.16/patcher).

## Installing Patcher
To install patcher you need yo choose if you want the latest stable release or the latest beta release. We recomend using the stable release for most people. 

Download the patcher executable from the links given above. Once you have your preffered release and downloaded the executeable, then cd into the directry where you have kept the downloaded executable and then run the following command. (You can also do the same by cloning into the Github repository).
```bash
sudo cp ./patcher /usr/local/bin
```
## Check if patcher is installed properly
* on a debian based system:
![image](https://user-images.githubusercontent.com/104187311/165019626-4daaf15f-d47e-43c4-b7c9-c525498f0b3a.png)
* on a fedora based system:
![image](https://user-images.githubusercontent.com/104187311/165018722-46efa242-be14-433d-8d5d-d9e19bf3a718.png)
* on my system:
![image](https://user-images.githubusercontent.com/104187311/165705109-2ef50228-ce13-4922-bd97-f1cb342bc688.png)


## FAQs
<details>
<summary>How does the release cycle of patcher work ?</summary>
<br>
Patcher's release cycle has three main brachnes. The stable branch, the testing branch and the beta branch. The beta branch is where new feautres are added to patcher and they are worked. The beta branch's code has some bugs which get's patched in the testing branch. In the testing the code from the beta branch gets edited to make if faster and more lightweight. We aslo try patcher on different architectures and also on different distros before releasing it to the stable brach. We recomend you to use the stable version of patcher to avoid errors and bugs.
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
