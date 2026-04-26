# Cry of Fear HUD
This addon for Garry's Mod attempts to replicate the Heads Up Display feature from the Half-Life full conversion mod Cry of Fear.

## Features
+   Health indicator
+   Armor indicator
+   Ammunition indicator
+   Damage effect
+   Custom death screen
+   Custom notification system
+   Custom item pickup history
+   Map and gamemode introductory sequence

## Customization includes
+   Toggle each feature separately
+   Element positioning
+   Custom icon for armor indicator
+   Alternate way to display ammo
+   Alternate way to display health and armor

## Adding custom content
**First of all** it's _highly recommended_ to use the built-in **add-ons** folder that comes with the addon. This is because the script will load any files inside that folder just after loading the HUD resources so no errors will appear.

To do this, you've got to put your custom scripts in the folder:

`lua/autorun/cofhud/add-ons`

Inside your own addon folder, or just directly into the garrysmod folder, but it's recommended to separate your scripts in addons.

### Adding ammo icons
There are two types of icons per ammo type:

+   **Bullet icon**: It's the icon shown in the clip indicator.
    -   It's _highly recommended_ to **NOT** make the texture **higher than 126px**.
+   **Ammo icon**: It's the icon shown _below_ the clip indicator.
    -   It's _recommended_ to give it a maximum size of **32x32px**.

Now, the methods to add ammo types to the mix are:

`COFHUD:AddBulletIcon(ammoType, texture, w, h, isMaterial);`

`COFHUD:AddAmmoIcon(ammoType, texture, w, h, isMaterial);`

>ammoType: Ammo type name
>
>texture: Either an Material or a Texture object
>
>w: Texture width
>
>h: Texture height
>
>isMaterial: Whether the texture is a Material object or not
