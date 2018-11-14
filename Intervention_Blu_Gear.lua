function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Aeneas','DualWeapons','Swords','NukeWeapons')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {main="Kali",sub="Genbu Shield"}  -- {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Kali",sub="Genbu Shield"}  -- {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.Swords = {main="Kali",sub="Genbu Shield"}  --{main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.NukeWeapons = {main="Kali",sub="Genbu Shield"}  -- {main="Carnwenhan",sub="Genmei Shield"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="kali",sub="Genbu",range="Gjallarhorn",  -- {main=gear.serenity_fc_staff,sub="Curatio Strap",ammo="Hydrocera", 
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +1",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales",feet="Bihu SLippers +2"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Gende. Galosh. +1"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {main="Kali",sub="Genbu Shield",range="Gjallarhorn",  -- range="Linos",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +1",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +1",feet="Bihu Slippers +2"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})  -- {range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"}) -- {range="Linos"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"}) -- {range="Linos"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})  -- {range="Marsyas"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})  --{range="Linos"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})  -- {range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})  -- {range="Linos"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})  -- {range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})  -- {range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +2"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +2"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +2"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {} -- ammo="Hasty Pinion +1",
		-- head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		-- body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		-- back="Ground. Mantle +1",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {} -- {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {}-- {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = 
	{main="Kali",sub="Genbu Shield",range= "Gjallarhorn",  -- {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +1",feet="Gende. Galosh. +1",}  -- legs="Aya. Cosciales +2",

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1",}
	sets.midcast.Lullaby = {hands="Brioso cuffs +2",range="Daurdabla",}
	sets.midcast['Horde Lullaby'] = {hands="Brioso cuffs +2",range="Daurdabla",}  -- {range="Marsyas"}
	sets.midcast['Horde Lullaby'].Resistant = {hands="Brioso cuffs +2",range="Gjallarhorn",}  -- {range="Linos"}
	sets.midcast['Horde Lullaby'].AoE = {hands="Brioso cuffs +2",range="Daurdabla",}
	sets.midcast['Horde Lullaby II'] = {hands="Brioso cuffs +2",range="Daurdabla",}  -- {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {hands="Brioso cuffs +2",range="Gjallarhorn",}  -- {range="Linos"}
	sets.midcast['Horde Lullaby II'].AoE = {hands="Brioso cuffs +2",range="Daurdabla",}
	sets.midcast.Madrigal = {head="Fili Calot +1",back="Intarabus's Cape",}
	sets.midcast.Paeon = {head="Brioso Roundlet +1",}
	sets.midcast.March = {hands="Fili Manchettes +1",}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})   
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {head="Fili Calot +1",
		body="Fili Hongreline +1",hands="Fili Manchettes +1",
		legs="Fili Rhingrave +1",feet="Fili Cothurnes +1",}
	sets.midcast["Sentinel's Scherzo"] = {neck="Sanctity Necklace",feet="Fili Cothurnes +1",}  -- Brioso Slippers still provides more Duration}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn",}  -- {waist="Luminary Sash",range="Linos"}
	sets.midcast.Mazurka = {range="Daurdabla",}  -- {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Kali",sub="Genbu Shield",range="Daurdabla",ammo=empty,  -- sub="Genmei Shield",range="Linos",ammo=empty,
		head="Fili Calot +1",neck="Moonbow Whistle",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Fili Hongreline +1",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Kishar Ring",  -- ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}  -- waist="Kobo Obi"

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Karaunos",sub="Elean Strap +1",range="Gjallarhorn",ammo=empty,  -- main="Kali",sub="Ammurapi Shield",range="Marsyas",ammo=empty,
		head="Brioso Roundlet +1",neck="Moonbow Whistle",ear1="Enchanter Earring +1",ear2="Digni. Earring",  -- head="Aya. Zucchetto +2"
		body="Fili Hongreline +1",hands="Inyan. Dastanas +1",ring1="Stikini Ring",ring2="Kishar Ring",  -- ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Refoccilation Stone",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}  -- waist="Luminary Sash"

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Karaunos",sub="Elean Strap +1",range="Gjallarhorn",ammo=empty,  -- {main="Kali",sub="Ammurapi Shield",range="Linos",ammo=empty,
		head="Brioso Roundlet +1",neck="Moonbow Whistle",ear1="Enchanter Earring +1",ear2="Digni. Earring",  -- head="Aya. Zucchetto +2",neck="Moonbow Whistle",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Bihu justaucorps +2",hands="Inyan. Dastanas +1",ring1="Stikini Ring",ring2="Kishar Ring",  -- body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Refoccilation Stone",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}  -- back="Intarabus's Cape",waist="Luminary Sash",legs="Inyanga Shalwar +2",feet="Aya. Gambieras +1"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main="Rubicundity",sub="Genbu Shield",range="Daurdabla",ammo=empty,  -- {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Terpander",ammo=empty,
		head="nyanga tiara +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",  -- head="Nahtirah Hat",
		body="Inyanga Jubbah +1",hands="Vanya cuffs",ring1="Kishar Ring",ring2="weatherspoon Ring",  -- body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Channeler's Stone",legs="Inyanga Shalwar +2",feet="Helios Boots"}  -- back="Intarabus's Cape",waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +1"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})
	
	-- Other general spells and classes.
	sets.midcast.Cure = {main="Serenity",sub="Curatio Grip",ammo="Orendas Tathlum",  -- head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        head="Nahtirah hat",neck="Colossus's Torque",ear1="Loquacious Earring",ear2="Mendi. Earring",  -- head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Inyanga jubbah +1",hands="Inyanga dastanas +1",ring1="Ephedra Ring",ring2="Hoama's Ring",  -- body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Sirona's Ring",
        back="Solemity Cape",waist="Witful Belt",legs="Kaykaus tights",feet="Gendewitha Goloshes +1"}  -- back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
		
	sets.Self_Healing = {neck="Colossus's torque",hands="Inyanga dastasnes +1",ring1="Ephedra Ring",ring2="Hoama's Ring",waist="Witful belt"}  -- {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {}  -- {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {}  -- sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {}-- {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		-- head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		-- body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- back="Intarabus's Cape",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{})  -- {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Karaunos",sub="Elan strap +1",ammo="Dosis Tathlum",  -- {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Brioso Roundlet +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Dignitary Earring",  -- head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Bihu justaucorps +2",hands="Brioso cuffs +2",ring1="Stikini Ring",ring2="Kishar Ring",  -- body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Rhapsode's Cape",waist="Refoccilation Stone",legs="Inyanga Shalwar +2",feet=" Brioso Slippers +2"}  -- back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {} --  {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		-- head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		-- body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Colossus's torque",hands="empty",
		ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Kali",sub="Genbu"})  -- {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {}  --{main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		-- head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		-- back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {main="Kali",sub="Genbu Shield",range="Gjallarhorn",  -- {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head=empty,neck="Bathy Choker +1",ear1="Infused Earring",ear2="Gwati Earring",  -- head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands="Inyanga dastanas +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",  -- body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Bihu Slippers +2"}  -- back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.idle.PDT = {}  -- {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		-- head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		-- back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	-- Defense sets

	sets.defense.PDT = {}  --{main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		-- head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		-- back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.defense.MDT = {}  -- {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		-- head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		-- back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.Kiting = {}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {}  -- {main="Marin Staff +1"}
	sets.IceNuke = {}  -- {main="Ngqoqwanb"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {}  -- {main="Aeneas",sub="Genmei Shield",ammo="Ginsen",
		-- head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		-- body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		-- back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.Acc = {}  -- {main="Aeneas",sub="Genmei Shield",ammo="Ginsen",
		-- head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		-- body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		-- back="Letalis Mantle",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	sets.engaged.DW = {}  -- {main="Aeneas",sub="Blurred Knife +1",ammo="Ginsen",
		-- head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		-- body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		-- back="Bleating Mantle",waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DW.Acc = {}  -- {main="Aeneas",sub="Blurred Knife +1",ammo="Ginsen",
		-- head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		-- body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		-- back="Bleating Mantle",waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 10)
end