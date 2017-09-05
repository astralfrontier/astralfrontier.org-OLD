---
title: Stormblood 4.0 Crafting
date: 2017-09-04 13:26:30
tags:
  - crafting
  - ffxiv
categories:
  - MMORPG
---

Now that FFXIV's Stormblood expansion has been with us for a few months,
I wanted to gather up everything I know about crafting in the new world
and share it in a single coherent place.

<!-- more -->

### Getting to 70

You should have all your Disciple of Hand classes at 70.
If you do not, I highly recommend the 1-70 guides available
at [FFXIV Guild](http://www.ffxivguild.com/).

I strongly encourage you to keep your Mining and Botany up to date as well.
If not, you will be buying a lot of materials you could farm for yourself.

### Post-70

#### Red and Yellow Scrip

Scrip is a custom currency for crafters.
In Stormblood, it comes in two flavors: Red (basic) and Yellow (advanced).
Gatherers have an identical system, but the two scrip types cannot be exchanged.
That is, Red Crafter's Scrip (for example) is not the same as Red Gatherer's Scrip.

To obtain scrip, look at the Timer (control-U), then click on Rowena's House of Splendors.
This will tell you the items you can deliver for the day to receive scrip.
Each collectible must be manufactured, or gathered, as a collectible,
and must meet a minimum collectibility value.
Craft this stuff the same way you would try to create any HQ item,
but with the Collectable Synthesis ability activated.

#### Specialization

You can use the [Specialist System](http://ffxiv.consolegameswiki.com/wiki/Specialist_System)
to specialize in up to three crafting classes.
These work very similar to combat jobs: you get an equippable soul, along with specific abilities.
Having the soul equipped also gives you +20 to both Craftsmanship and Control.

What should you specialize in?
I recommend Alchemy, Goldsmithing, and Weaving if you are trying to do it all yourself,
as these classes create most of the precursors for high-level recipes.

You can spend red scrip to change your specialization later.
See the wiki page for details.

#### Master Recipes and Regional Folklore

The Splendors Vendor in Rhalgar's Reach (X: 9, Y: 12)
sells six fieldcraft items: Tomes of Geological, Botanical, and Ichthyological folklore for Gyr Abania and Othard.
Each tome costs 50 Rowena's Token (Regional Folklore).
These tokens are sold by the Scrip Exchange vendor a few doors down, 50 Red Scrip per token.
Thus, you'll need 2500 Red Gatherers' Scrip per Tome, or 15,000 for all of them.
For most crafting needs, you only need the Geological and Botanical Tomes.

The Scrip Exchange vendor also sells Master V recipe books
for all crafting professions, costing 900 Red Crafter's Scrip apiece.
These contain the level 70 two-star recipes you want to eventually make.

### Material Gathering

The most useful tool for gathering from ephemeral and legendary nodes
is [Garland Tools](https://www.garlandtools.org/bell/).
The site includes maps, rotations, and timers for rare nodes.
Other sites, like [FFXIV Clock](ffxivclock.com/#/),
also include timers, but Garland Tools pulls it all together.

#### Aetherial Reduction

You'll be doing a lot of farming for crystals and clusters.
FFXIV includes a tool to help you acquire these very quickly:
[Aetherial Reduction](http://ffxiv.consolegameswiki.com/wiki/Aetherial_Reduction).
You must be level 56 or higher, and complete a quest, to unlock this.
See the link for details.

When you see an Ephemeral Node on your map,
make sure Collector's Glove is active, then harvest from the node.
Once the node is exhausted, you can force it to respawn, by tapping two nearby nodes.
In Stormblood, gathering nodes come clustered together.
You don't have to fully harvest the regular nodes, just hit them once.
Ephemeral Nodes will continue to spawn for four hours Eorzea time.

Once you have harvested the collectibles,
right-click on them in your bag and select "Aetherial Reduction".

#### Aethersands

Many high-level recipes call for one or more types of "Aethersand".
These can be obtained by Aetherial Reduction.

You can find the complete list, along with notes on how and when to find them,
[here](https://www.reddit.com/r/ffxiv/comments/6ne73j/shiny_new_aethersands_and_where_to_find_them/).

### Getting Geared

Your goal is to reach at least 290 equipped with your crafting gear.
I did this by creating HQ 290 gear myself,
made by WVR, LTW, and CRP.
You can see this gear here, along with recommended melds: [http://ffxiv.ariyala.com/11VCH](http://ffxiv.ariyala.com/11VCH).

In addition to this gear, the Scrip Exchange vendor in Rhalgar's Reach sells level 300 items for Yellow Scrip.
The main hand tools cost 1300 scrip apiece, while completely outfitting yourself in the gear for a single class costs 2400 scrip.
I personally opted for a universally usable crafting set,
so I crafted the 290 gear and am buying the yellow scrip tools.
You must still craft or buy offhands yourself, so don't neglect BSM too.

The recommended melds came from [Katya's post](http://forum.square-enix.com/ffxiv/threads/337993-Stormblood-1%2A-and-2%2A-Crafting-Macros)
and cost me about 4 million gil.
You might find it cheaper to pursue the Yellow Scrip gear,
but grinding crafting with Potent Spiritbond Potions
active should let you convert your spiritbound gear
and sell it for this much money.
Either way, check the rotations below for minimum stats,
and make sure you meet those stats.

### Rotations

At 70, I use three rotations for crafting, depending on what I'm making.
I used these to craft my HQ 290 gear.

Credit for the 40 and 80 durability macros goes to Mahiko,
in the [FFXIV Guild Leveling Guide](https://www.ffxivguild.com/ffxiv-wvr-weaver-leveling-guide-ffxivarr/6/).
Credit for the two-star macro goes to Katrisa Ashe of Ultros,
posting at [Stormblood 1* and 2* Macros](http://forum.square-enix.com/ffxiv/threads/337993-Stormblood-1%2A-and-2%2A-Crafting-Macros).

Break these into separate macros, separated by the `/echo` lines.
Also, don't forget to make sure your cross-class skills
include every ability named in the macro!
That includes Comfort Zone, Ingenuity II, Byregot's Blessing, Steady Hand II,
Muscle Memory, Innovation, Waste Not, and Piece by Piece.

#### 40 Durability

Minimum stats: 407 CP.
Use NQ Tempura Platter as your food.
Use this for precursor materials (cloth, ingots, alchemy, etc.).

```
/ac "Comfort Zone" <me><wait.2>
/ac "Inner Quiet" <me><wait.2>
/ac "Steady Hand II" <me><wait.2>
/ac "Patient Touch" <me><wait.3>
/ac "Basic Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Manipulation II" <me><wait.2>
/ac "Steady Hand II" <me><wait.2>
/ac "Prudent Touch" <me><wait.3>
/ac "Innovation" <me><wait.2>
/ac "Prudent Touch" <me><wait.3>
/ac "Great Strides" <me><wait.2>
/echo 40 DUR Part 1 finished <se.1>
/ac "Byregot's Blessing" <wait.3>
/ac "Ingenuity II" <me><wait.2>
/ac "Careful Synthesis III" <me><wait.3>
/ac "Careful Synthesis III" <me><wait.3>
/ac "Careful Synthesis III" <me><wait.3>
/echo 40 DUR Part 2 finished <se.14>
```

#### 80 Durability

Minimum stats: 407 CP.
Use NQ Tempura Platter as your food.
Use this for non-Master recipes.

```
/ac "Muscle Memory" <wait.3>
/ac "Comfort Zone" <wait.2>
/ac "Inner Quiet" <wait.2>
/ac "Steady Hand II" <wait.2>
/ac "Hasty Touch II" <wait.3>
/ac "Hasty Touch II" <wait.3>
/ac "Basic Touch" <me><wait.3>
/ac "Basic Touch" <me><wait.3>
/ac "Basic Touch" <me><wait.3>
/ac "Manipulation II" <wait.2>
/ac "Steady Hand II" <wait.2>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/echo 80 DUR Part 1 finished <se.1>
/ac "Great Strides" <wait.2>
/ac "Byregot's Blessing" <wait.3>
/ac "Ingenuity II" <wait.2>
/ac "Careful Synthesis III" <wait.3>
/ac "Careful Synthesis III" <wait.3>
/ac "Careful Synthesis III" <wait.3>
/ac "Careful Synthesis III" <wait.3>
/echo 80 DUR Part 2 finished <se.14>
```

#### Two-Star

Minimum stats: 1288 Craftsmanship, 467 CP.
Use NQ Tempura Platter as your food (this is not optional).

If you start with about 2000 Quality (which should be easy enough),
this should give you an HQ end product every time.

```
/ac "Muscle Memory" <me> <wait.3>
/ac "Comfort Zone" <me> <wait.2>
/ac "Inner Quiet" <me> <wait.2>
/ac "Manipulation II" <me> <wait.2>
/ac "Steady Hand II" <me> <wait.2>
/ac "Piece by Piece" <me> <wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Observe" <me> <wait.3>
/ac "Focused Synthesis" <me> <wait.3>
/echo Advanced Part 1 finished <se.1>
/ac "Comfort Zone" <me> <wait.2>
/ac "Steady Hand II" <wait.2>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Prudent Touch" <me><wait.3>
/ac "Steady Hand" <me><wait.2>
/ac "Ingenuity II" <wait.2>
/ac "Innovation" <me><wait.2>
/ac "Great Strides" <wait.2>
/ac "Byregot's Blessing" <wait.3>
/echo Advanced Part 2 finished <se.1>
/ac "Careful Synthesis III" <wait.3>
/ac "Careful Synthesis III" <wait.3>
/ac "Careful Synthesis III" <wait.3>
/echo Advanced Part 3 finished <se.14>
```