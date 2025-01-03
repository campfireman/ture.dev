---
title: "Using dgVoodoo 2 to run FIFA Manager 2010 on Windows 11"
date: "2025-01-03"
draft: true
---

My brother loves playing FIFA Manager 2010. He is willing to get up at 5:00 in the morning just to play a couple of minutes in peace before he has to take care of his children and head out to his job. The problem: His new laptop (which I chose for him...) ran the game once and then kept on complaining about a missing hardware accelerator.

After trying all possible articles on Google and Bing we were hopeless. All Windows compatibility modes, Hyper-V, dxwnd, etc. did not work. However, I will spare you all the different combinations we tested.

## The specifications

I think a unique issue was the hardware. Laptops tend to be more fiddly and less supported:

Lenovo [Ideapad 5 Pro 16ACH6](https://pcsupport.lenovo.com/uu/de/products/laptops-and-netbooks/5-series/ideapad-5-pro-16ach6) with most notably:

- CPU: AMD Ryzen 5600HX
- GPU: NVIDIA GTX 1650 + iGPU

**Because of this specific hardware this solution might need a slightly different configuration for you machine or may not work entirely.**

## The solution

Picking ChatGPT got me to a viable solution: [dgVoodoo2](https://github.com/dege-diosg/dgVoodoo 2). It implements old DirectX APIs with newer DirectX versions and gives more options for working out issues.

### 0. Disable compatibility modes

From previous tinkering you might still have some compatibility settings on your `FM10.exe`. Untick all of them as they will interfere with dgVoodoo 2.

### 1. Download

You can find the latest release on github: https://github.com/dege-diosg/dgVoodoo 2/releases.
Extract the zip archive in a location of your liking.

### 2. Copy DLLs

For the software to do its voodoo magic you need to copy the x86 DirectX DLLs from `C:\you\voodoo\folder\x86\D3` to the location of your FIFA Manager 2010. In our case that was e.g. `C:\shitty\win\paths`. For simplicity copy all four files:

- 1
- 2
- 3
- 4

### 3. Test

After copying the DLLs the game should already be able to start. In my case there were several issues that prevented the game from running without crashes. Nevertheless, first, we want to make sure configurations apply.

#### 3.1 Run with watermark

#### 3.2 Run without watermark

If the watermark disappeared, the settings have been applied correctly. If not, check the [official documentation](https://dege.freeweb.hu/dgVoodoo 2/). My explanation might be incomplete.

### 4. General Configuration

In the general tab we want to set:

- graphics card iGPU!
- mouse
- window stuff

### 5. DirectX Configuration

Uncheck all fancy stuff

### 6. Profit??

The game should work now!

## Tips for troubleshooting

- Use the watermark to verify whether your settings have been applied or not.
- Core issues might be
