---
layout: post
title:  "Keep 3D printing filament dry properly – make an airtight spool container"
author: iliao
categories: [ 3D-printing, Tutorial, Mods ]
image: assets/images/webp/PXL_20230828_025257957-1024x771.webp
featured: true
hidden: true
comments: false
redirect_from:
  - /2023/08/28/airtight-filament-spool-container/
---
If you print only PLA filament, I don't think you need any of this "nonsense". Otherwise, if you print just about everything else including PETG, ABS, ASA, Nylon, TPU, polycarbonate and so on - read on!

Most 3d printing filaments, except PLA, are hygroscopic, i.e., they absorb moisture from the air. You can usually tell that your filament got moist by

- Hearing the distinct popcorn-popping sound as the filament makes its way through the 3D printer's extruder. The extruder quickly heats up tiny moisture pockets, turning them into little bubbles of compressed steam.
- Noticing your print having unusually many pockmarks left by the steam bubbles that have burst.
- Noticing atypically lots of stringing in your print.

Once, when I didn't know any better, I tried 3D-printing a tire using a newly purchased flexible TPE filament. I took off the packaging of the filament spool, hoisted the spool on top of my Prusa MK3S and started the print. After 5-10 minutes, I started hearing the popping sound, the print got stringy, and the tire started getting riddled with conspicuous pockmarks. That's how quickly your filament can go bad!

|![Moist ABS filament shows stringing, pockmarks - especially at the bottom](/assets/images/webp/stringing-1.webp 'Moist ABS filament shows stringing, pockmarks - especially at the bottom'){:class="zoom-image"}|![Another example of moist ABS filament](/assets/images/webp/stringing-1.webp 'Another example of moist ABS filament'){:class="zoom-image"}|

If your print looks similar to the pictures above, moisture may have ruined your filament - and you need a few things to keep your filament dry:

- an airtight filament container
- desiccant of a certain type
- a hygrometer

<blockquote>{% include signup-form.html %}</blockquote>

Tip: your filament being wet is only one of several reasons for stringy prints. Other reasons may include

- insufficient print cooling - check your print fan speed
- printing too hot - check your extruder temperature setting
- filament retraction settings - try a number greater than zero
- extruder path - try setting the "seam position" setting in your slicer away from "random"

## Build Instructions

|![An airtight filament spool container connected to a Prusa MK3S (Caribou 420 frame) 3D printer](/assets/images/webp/PXL_20230828_025257957-1024x771.webp 'An airtight filament spool container connected to a Prusa MK3S (Caribou 420 frame) 3D printer'){:class="zoom-image"}|![An airtight filament spool container connected to a Voron 2.4 3D printer](/assets/images/webp/PXL_20230222_235706238-771x1024.webp 'An airtight filament spool container connected to a Voron 2.4 3D printer'){:class="zoom-image" width="75.3%"}|

First, get yourself an airtight container that fits a typical 1KG spool of filament:

- Search Amazon for a Rubbermaid 21-Cup Dry Food Container
- As of 08-2023, Ace Hardware sells one [here](https://www.acehardware.com/departments/home-and-decor/kitchen-utensils-and-gadgets/food-storage/6192892)

The container dimensions should be 10.5"H x 9.3"L x 4.7"W.  The height and the length can be larger, but the width should not exceed 5". The container's lid should be plain, as illustrated above - no fancy lid-built-into-another-lid, easily-pour-your-cereal types.

Second, get yourself the items below. Search Amazon if needed.

- a piece of standard PTFE tubing with 2mm inside and 4mm outside diameters. The length depends on your 3D printer setup - usually 50cm should be plenty enough.
- a PTFE tube PC4-M10 fitting, i.e., one with a M10 6mm thread and an inner diameter of 4mm to match your PTFE tube.

There are at least two types of PTFE tube fitting - PC4-M10 and PC4-M6. Use the one with the thicker base - shown below on the left - so that the PTFE tube can go through the fitting all the way. A fitting with a narrow base ends up scratching filament when the filament comes in at an angle. The scratched-off filament debris clog up the fitting and block the filament's motion.

![Use PC4-M10 feed-through PTFE tube fitting (left) to avoid clogging](/assets/images/webp/PXL_20230828_025111877_cropped-1024x756.webp 'Use PC4-M10 feed-through PTFE tube fitting (left) to avoid clogging'){:class="zoom-image"}

Next, [download](https://github.com/makerspet/filament_spool_holder/) and 3D-print:

- A "spool insert", see CAD screenshots below.
- Two spool insert "side holders".

|![Spool insert assembly](/assets/images/webp/spool-holder-assembly-1024x576.webp 'Spool insert assembly'){:class="zoom-image"}|![Spool inserts for filament spools having different center hole diameters](/assets/images/webp/PXL_20230905_004921284-1024x576.webp 'Spool inserts for filament spools having different center hole diameters'){:class="zoom-image"}|
|![Spool insert side holder](/assets/images/webp/spool-holder-axle-1024x576.webp 'Spool insert side holder'){:class="zoom-image"}|![Spool insert](/assets/images/webp/spool-insert-1024x576.webp 'Spool insert'){:class="zoom-image"}|

Choose a spool insert's outer diameter that fits into your filament spool. Choose the largest insert diameter that still makes your spool rotate effortlessly over the spool insert. 

Assemble your filament container:

- Drill a 6mm side hole on each "largest" side of the container.
- Use 2x M6x12 screws and 2x M6 washers to mount the spool insert side holders, one on each side.
- Drill a 9mm hole in the container lid as shown and screw in the PTFE tube fitting.
- Insert the spool holder inside the spool.
- Use your hand to spread the large sides of the container apart just enough to insert the spool into the container, such that the spool axle side holders "snap" into the spool holder's side openings. This step may take some practice.
- When assembled correctly, the spool should rotate effortlessly inside the container.
- Insert your PTFE tube into the lid fitting and trim the PTFE tube to size for your 3D printer setup.

Make sure the holes are centered on the container's side and aligned with respect to each other. You don't want your spool insert sitting crooked in the container.

- Start by laying the container flat on the table.
- Place a spool on top of the container, like a sandwich.
- Center the spool on top of the container - eyeballing may be enough.
- Mark the center of the spool on the container's side.
- Double check the center mark's location with a ruler.
- Repeat the above with the other side of the container

Your assembled filament container should look like the pictures below:

|![Assembled airtight container - without the spool](/assets/images/webp/PXL_20230827_211419899_cropped-1024x894.webp 'Assembled airtight container - without the spool'){:class="zoom-image"}|![Your airtight filament container should look like this](/assets/images/webp/PXL_20230827_211120454-771x1024.webp 'Your airtight filament container should look like this'){:class="zoom-image" width="87.3%"}|

Lastly:

- Run the filament through the lid fitting and the PTFE tube.
- Close off the container using the lid and make sure the lid makes an airtight seal.
- Connect your PTFE tube to your printer and insert the filament into your 3D printer's extruder.

Here are Prusa MK3S and Voron 2.4 examples. In case of Prusa 2.5S/3S/4 and its clones, just let the PTFE tubing's end touch the extruder - don't force the tube inside the extruder's top opening.

|![Let your PTFE tube touch your Prusa MK3S printer's extruder](/assets/images/webp/PXL_20230827_212045194-771x1024.webp 'Let your PTFE tube touch your Prusa MK3S printer extruder'){:class="zoom-image"}|![Connect your PTFE tube to your Voron 2.4 printer](/assets/images/webp/PXL_20230222_235726106-771x1024.webp 'Connect your PTFE tube to your Voron 2.4 printer'){:class="zoom-image"}|

<p></p>
Word of caution, once you've inserted your spool inside the container, watch out for filament slipping off the spool - it can jam our print!

![Watch out for filament slipping off the spool - it can jam your print](/assets/images/webp/PXL_20230828_025724476-771x1024.webp 'Watch out for filament slipping off the spool - it can jam your print'){:class="zoom-image"}

Great, you've made it to the end of the article! In the next article we will talk about which kind of desiccant to use in your spool container.

Please find all files in this Maker's Pet GitHub [repository](https://github.com/makerspet/filament_spool_holder/) available for download.

Happy 3D printing!
