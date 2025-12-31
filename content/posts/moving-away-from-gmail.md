---
title: "Moving away from Gmail"
date: "2025-12-31"
description: "Finally getting more digitally independent"
---

The [Digital Independence Day](https://di.day) presented at the [39C3](https://events.ccc.de/congress/2025/infos/startpage.html) has motivated me to start some of my long-postponed projects. I decided to start with the most painful but also most important one: Getting rid of my dependence on Gmail.

<!--more-->

My personal Gmail address is used by a great many services, so changing it involves a lot of pain. Therefore, it was important to me to choose a solution that eliminates the need for such a migration forever.

## Personal Domain

The first component is a personal domain: In my case, I chose `ture.dev`. By using a domain I own myself, I am free to use whatever mail provider I want without having to change my e-mail. Personally, I chose [do.de](https://do.de) as my registrar but this has more sentimental reasons. I am no expert here and most choices should be fine as you can migrate your registration to other providers down the road.

![In 2017 my IT journey started with wordpress on do.de (by courtesy of archive.org)](/do_de_landing_page_in_2017.png)

## Mail Provider

Once the domain is ready, the choice of provider is next. I have not done thorough auditing myself, but relied more on the opinions of reputable institutions. [Self-hosting seemed cool](https://news.ycombinator.com/item?id=34117386); however, I decided not to run my truly critical stuff myself. For the same reason I don't self-host my Nextcloud anymore. I landed at [Proton Mail](https://Proton.me/) as I found their strong encryption features intruiging. There are some nice articles weighing the ups and downs of different providers as Proton is definitely not the universally best choice. Here are some German articles:

- [di.day](https://di.day/posteo-mailbox-org/)
- [Kuketz](https://www.kuketz-blog.de/empfehlungsecke/#email-anbieter)
- [Digital Courage](https://digitalcourage.de/digitale-selbstverteidigung/vertrauenswuerdige-e-mail-anbieter)

Because I own my domain, migrating away from Proton for whatever reason is no problem anymore. On the technical side, there is some configuration to be done before the mailing works, but Proton has a really [good guide](https://Proton.me/support/custom-domain) and (imo) UI/UX so it was really simple.

![Helpful UI in Proton to indicate domain configuration issues](/Proton_domain_setup.png)

## Subaddressing

A feature I stumbled across a few years ago is [subaddressing](https://www.rfc-editor.org/rfc/rfc5233). Let's say your mail is `peter@parker.com`. When your provider supports subaddressing, you can freely add any text to the address with `+` like this: `peter+spiderman@parker.com`. Without further configuration, all mail will be delivered to the original address.

I use this as a strategy to attribute data leaks to services: `peter+sexshop@parker.com` will help to attribute the sudden spike in dubious spam to the sexshop you have registered at recently. In Proton this worked out of the box.

## Migration Strategy

I decided to be lazy and only migrate high-volume services like `amazon.com` (I know...) and `otto.de` for now. This is to de-risk the project a little in case I should discover issues, but also because of the volume of services.

![Searching in keepassxc uncovered 220 usages of my Gmail address](/keepass_gmail_usage_search.png)

Then, once I receive an e-mail on my Gmail account, I will migrate that service as well. I will save the quiet rest for a rainy day...

My e-mail account involves so much personal and sensitive data that it is really a good feeling to be away from Google. They can draw so many conclusions about me through my e-mails that it surely must be their most valuable product after search.
