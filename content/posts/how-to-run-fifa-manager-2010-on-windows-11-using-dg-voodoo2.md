---
title: "How to Run FIFA Manager 2010 on Windows 11 Using dgVoodoo 2"
date: "2025-01-03"
description: "A quick tutorial on how to get FIFA Manager 2010 running on Windows 11"
---

My brother loves playing FIFA Manager 2010 (FM10). He is willing to get up at 5:00 in the morning just to play a couple of minutes in peace before he has to take care of his children and head out to his job.

## The problem

His new laptop (which I chose for him...) ran the game once and then kept on complaining about a missing hardware accelerator. Specifically, a black popup in the background called "EAGL PC CAPS RETRIEVAL" appeared and a notification saying "Für FUSSBALL MANAGER 10 wird ein Hardware-Grafikbeschleuniger benötigt".

After reading all possible articles with trouble shooting advice on Google and Bing we were hopeless. All Windows compatibility modes, Hyper-V, dxwnd, etc. did not work. However, I will spare you all the different combinations we tested.

## The specifications

I think a unique issue was the hardware. Laptops tend to be more fiddly and less supported. In our case it is a Lenovo [Ideapad 5 Pro 16ACH6](https://pcsupport.lenovo.com/uu/de/products/laptops-and-netbooks/5-series/ideapad-5-pro-16ach6) with most notably:

- CPU: AMD Ryzen 5600HX
- GPU: NVIDIA GTX 1650 + iGPU

**Because of this specific hardware this solution might need a slightly different configuration for you machine or may not work entirely.**

## The solution

Poking ChatGPT got me to a viable solution: [dgVoodoo2](https://github.com/dege-diosg/dgVoodoo2). It implements old DirectX APIs with newer DirectX versions and gives more options for working out issues.

![FIFA Running!](/fm10_start_screen.png)

### 0. Disable compatibility modes

From previous tinkering you might still have some compatibility settings on your `Manager10.exe`. Remove all of them (or reinstall if unsure) as they will interfere with dgVoodoo 2.

### 1. Download

To get started:

1. Download the [latest release on github](https://github.com/dege-diosg/dgVoodoo2/releases).
2. Extract the zip archive in a location of your liking.
3. Copy the x86 DirectX DLLs from `C:\Users\YOUR_USER\Downloads\dgVoodoo2_84_1\MS\x86` to the location of your FIFA Manager 2010. In our case that was e.g. `C:\Program Files (x86)\EA SPORTS\FUSSBALL MANAGER 10`. For simplicity copy all four files (D3DImm.dll, DDraw.dll, D3D8.dll, D3D9.dll).

![FIFA Running!](/fm10_with_dgvoodoo2_files.png)

### 2. Test

After copying the DLLs the game should already be able to start. In my case there were several issues that prevented the game from running without crashes. If the game does not start, jump to step 3. When you start the game, you should see a little watermark in the corner, indicating dgVoodoo is working behind the scenes. Try the game, maybe it already works. In our case the mouse would not work.

![dgVoodoo 2 watermark](/fm10_dgvoodoo2_watermark.png)

First we want to make sure new settings are actually applied by removing the watermark.

![Configure the path](/dg_voodoo2_config_path.png)

1. Go to the folder where you extracted dgVoodoo2 and run the `dgVoodooCpl.exe`. Windows might prompt you about security concerns but this is fine.
2. In the top dropdown you can configure where the settings are stored. Enter the location of your FM10 installation (e.g. `C:\Program Files (x86)\EA SPORTS\FUSSBALL MANAGER 10`). Apply.
3. Then click the DirectX tab and uncheck **dgVoodoo Watermark**.
4. Restart the game.

If the watermark disappeared, the settings have been applied correctly. If not, check the [official documentation](https://dege.freeweb.hu/dgVoodoo2/). My explanation might be incomplete.

### 3. General Configuration

Now comes the actual fiddling. In the screenshots you can the settings we applied to get the game running. Your experience might differ:

- Set **Adapter(s) to use / enable** to the iGPU. In our case it worked better than the dedicated GPU (dafuq?).
- Set **Windowed** to `Unspecified`.
- Uncheck **Keep window aspect ratio**.
- Uncheck **Capture mouse**. This is very important to get the mouse running again.

For double checking refer to the screenshot.

![dgVoodoo 2 general tab configuration](/dg_voodoo2_general.png)

### 4. DirectX Configuration

The next step is to configure DirectX specific settings:

- Set **Videocard** to `GeForce 9800 GT`. Others may work fine as well.
- Set **VRAM** to `512MB`.
- Check **Application controlled fullscreen/windowed state**.

![dgVoodoo 2 DirectX tab configuration](/dg_voodoo2_directx.png)

### 5. Profit??

The game should work now! If the game still doesn’t work as expected, here are some tips for troubleshooting:

- Use the watermark to verify whether your settings have been applied or not.
- Play around with window settings.
- Only change one setting at a time and try again to isolate variables.

In case you have any questions or feedback, go to the [contact page](/contact/).
