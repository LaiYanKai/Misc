
# 2&emsp;Mounting Ubuntu 22.04 LTS in Oracle VirtualBox
About 7GB of Wi-Fi is required for this section.
  
1. Go to https://releases.ubuntu.com/jammy/ and download `64-bit PC (AMD64) desktop image` (`.iso`) which should be the first option. This is the **Ubuntu 22.04 Desktop Image**. This file size is approximately 4.7 GB.
  
2. Open Oracle VirtualBox. Ignore any prompts to update to version 7 and above by clicking `OK` or closing the prompt.
  
3. On VirtualBox, click `New` to create a new Virtual Machine.
   
    ![image](https://github.com/user-attachments/assets/ed5c17a9-1cd8-4dde-9111-3e025cce4ff6)

4. Type `Ubuntu 22.04` in the `Name` field and click `Next`.
   
    ![image](https://github.com/user-attachments/assets/d1765b66-e0c8-4875-ab54-bd5eac2dd3c4)


5. Slide the memory to the end of the green bar and click `Next`.
   
    ![image](https://github.com/user-attachments/assets/873a43cb-2d6c-4639-9beb-e00a6e92a91c)

  
6. Select `Create a virtual hard disk now` and click `Next`.
    
    ![image](https://github.com/user-attachments/assets/19dc676d-7ad3-41c0-b9de-fe23048592a0)

  
7. Select `VDI` and click `Next`.
    
    ![image](https://github.com/user-attachments/assets/a80c2c1a-6562-4e67-8e3f-8ddf8f2133d2)

  
8. Select `Dynamically allocated` and click `Next`.

    ![image](https://github.com/user-attachments/assets/494c3b59-1fdd-4416-a1a7-b01b2d78c248)

  
9. Select at least `30 GB` and click `Create`.
    
    ![image](https://github.com/user-attachments/assets/23c0a206-e9cb-418b-a474-3444d4129a5d)

  
10. Once you are back on the main page of VirtualBox, select the newly created virtual machine `Ubuntu 22.04`, and click `Settings`.
    
    ![image](https://github.com/user-attachments/assets/f2304f92-a999-4503-a0b8-e486f8476559)

  
11. Under `General`, in the `Advanced` tab, select `Bidirectional` in `Shared Clipboard`.
    
    ![image](https://github.com/user-attachments/assets/292a4105-123d-410c-8b07-2b50bf533d76)

  
12. Under `System`, in the `Processor` tab, slide the `Processor(s)` to end of the green bar.
    
    ![image](https://github.com/user-attachments/assets/7f4941a5-619a-4125-bbb2-f31814398c3a)

  
13. Under `Display`, in the `Screen` tab, slide the `Video Memory` to the end of the green bar.

    ![image](https://github.com/user-attachments/assets/787ec064-4a0f-4db1-ac8a-0258e56f7c77)

  
14. Under `Storage`, select `Empty` under `Storage Devices`, click the CD-rom icon on the right, and `Choose a disk file...` to find the Ubuntu 22.04 desktop image.

    ![image](https://github.com/user-attachments/assets/58657f29-d393-413f-bdb1-c47381948639)

  
16. Click `OK` at the bottom-left of the Settings window, which will bring you back to the main window.
  
17. Select the `Ubuntu 22.04` virtual machine and click `Start`.
    
    ![image](https://github.com/user-attachments/assets/3c7bd7c5-ac63-4a67-b0e0-10b5575e2a1e)

18. Proceed to the next [section](https://github.com/LaiYanKai/Misc/blob/main/ee4308/3_install_ubuntu.md).
