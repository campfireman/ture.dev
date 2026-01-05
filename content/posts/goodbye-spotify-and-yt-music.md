---
title: "Goodbye Spotify and YT Music"
date: "2026-01-05"
description: "Taking back the ownership of my music"
mastodonPostID: "115844526704716124"
---

While browsing the music from my ancient iPod backup in Nextcloud, it hit me: Can I stream this from Nextcloud to my phone? This question set off my exodus from Spotify (and YouTube Music).

<!--more-->

Aside from the nostalgia of hearing my old music, I realized that actually owning the music you like is so much more sustainable. I never bothered to transfer likes from Spotify and YouTube Music so the data is just bottled up there. These platforms offer really nice features but the lock-in does not seem worth it anymore.

## Overview

As is the norm in computer science, someone has already thought of this. There is quite a mature [Nextcloud extension](https://apps.nextcloud.com/apps/music) which implements both [Ampache](https://ampache.org/) and [Subsonic](https://subsonic.org/pages/api.jsp) APIs. These APIs handle the streaming and also allow synchronizing the metadata about the music as well as playlists, radios and podcasts.

![A small overivew of the most important components of my music streaming setup](/music_setup_overview.drawio.svg)

Let's look at the components in more detail.

## Nextcloud

I have been using Hetzner's Nextcloud offering called [Storage Share](https://www.hetzner.com/de/storage/storage-share/) for about five years now. The pricing and features there are outstanding. Especially the possibility to add CNAME entries is very nice. Regarding stability, I have not encountered any issues. They even handle updates automatically.

![The Nextcloud music interface is a bit clunky but everything is stable and gets the job done](/nextcloud_music_interface.png)

Because of the sync client I can just drop new music files into my music folder locally, they will be synced to Nextcloud and then show up on the APIs in about a minute after upload as well.

Regarding the Nextcloud ecosystem in general I must say I am content but I am not in love. The sync client can be buggy, and the web interface is sometimes slow. However, everything is based on open protocols and at its core, there are just files. So if there is a better solution down the road based on the same standards I can just migrate. This is how it should be for all software!

## Symfonium

I looked at quite a few streaming clients for Android that are compatible with either Ampache or Subsonic. There are quite a few open source ones but they all seemed to be abandoned. [Symfonium](https://symfonium.app/) offered a free trial and I was convinced quite quickly. Everything works smoothly and is stable. The developer is very eager to [engage with customers and implement new features](https://support.symfonium.app/). I have never seen a music player where you can customize every tiny piece of the UI.

![The Symfonium app is highly customizable and even looks great! This uncompressed FLAC from Bandcamp clocks in at an insane 1704 kb/s](/symfonium_optics.png)
{.img-width-70}

I deem the "lock-in factor" from using a proprietary app as quite low here. Playlists are synced back and the music stored some place else anyway. Symfonium is essentially just a lens on the data and not a container. The only negative thing I see at the moment is the fact that liking a song is not synced. I would much rather have a reliable app and am happy to pay for that as long as I am not being trapped.

![The Symfonium app supports Sonos out of the box and allows simple creation of groups](/symfonium_sonos_support.png)
{.img-width-70}

I have a good feeling this setup can accompany me for a long time. The only issue that is not solved yet is how to discover new content based on my habits but there are some potential avenues for that, perhaps by integrating Last.fm or similar scrobbling services.
