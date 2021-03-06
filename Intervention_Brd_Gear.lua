function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Normal','DD') --'DualWeapons','Swords','NukeWeapons'

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
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
	sets.weapons.Main = {main="Tauret",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Tauret",sub="Demersal Degen"}
	sets.weapons.Swords = {main="Vampirism",sub="Demersal Degen"}
	sets.weapons.NukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Grioavolr",sub="Clerisy Strap",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {main="Grioavolr",sub="Clerisy Strap",range="Gjallarhorn",  --sub="Clerisy Strap"
		head="Fili Calot",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Brioso Justau. +3",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Terpander"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Terpander"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Terpander"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Terpander"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back="Ground. Mantle +1",waist="Fotia Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Kali",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2"} --,feet="Gende. Galosh. +1"

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave"}--{legs="Fili Rhingrave"}
	sets.midcast.Lullaby = {}
	sets.midcast['Horde Lullaby'] = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby'].AoE = {range="Terpander"}
	sets.midcast['Horde Lullaby II'] = {range="Terpander"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Terpander"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Terpander"}
	sets.midcast.Madrigal = {head="Fili Calot"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Gjallarhorn"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {} --feet="Fili Cothurnes +1" Brioso Slippers still provides more Duration
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Gjallarhorn"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Kali",sub="Genmei Shield",range="Gjallarhorn",ammo=empty,
		head="Fili Calot",neck="Mnbw. Whistle +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Fili Hongreline +1",hands="Fili Manchettes",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Kobo Obi",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Kali",sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +2",
		feet="Brioso Slippers +3",
		waist="Luminary Sash",
		neck="Mnbw. Whistle +1",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",
		back="Intarabus's Cape",
		}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Kali",sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +2",
		feet="Brioso Slippers +3",
		waist="Luminary Sash",
		neck="Mnbw. Whistle +1",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",
		back="Intarabus's Cape",
		}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=grioavolr_fc_staff, sub="Clerisy Strap",range="Terpander",ammo=empty,
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Brioso Cuffs +3",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",}
	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	-- sets.midcast.Cure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Pemphredo Tathlum",
        -- head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        -- body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Sirona's Ring",
        -- back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
		
	-- sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	-- sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	-- sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	-- sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		-- head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		-- body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- back="Intarabus's Cape",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	-- sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	-- sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		-- head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		-- body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	-- sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap",ammo="Dosis Tathlum",
		-- head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		-- body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	-- sets.midcast.Helix = sets.midcast['Elemental Magic']
	-- sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	-- sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		-- ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	-- sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Kali",sub="Genmei Shield",
		head="Aya. Zucchetto +2",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands=gear.chironic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {main="Kali",sub="Genmei Shield",
		head="Aya. Zucchetto +2",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands=gear.chironic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Assid. Pants +1",feet="Fili Cothurnes +1"}

	sets.idle.PDT = {main="Kali",sub="Genmei Shield",
		head="Aya. Zucchetto +2",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands=gear.chironic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	
	-- Weapons sets
	sets.weapons.None = {}
	sets.weapons.Normal = {main="Kali",sub="Genmei Shield"}
	sets.weapons.DD = {main="Tauret",sub="Genmei Shield"}
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Assid. Pants +1",feet="Aya. Gambieras +2"}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Assid. Pants +1",feet="Aya. Gambieras +2"}

	sets.Kiting = {}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Tauret",sub="Genmei Shield",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rajas Ring",ring2="Apate Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.Acc = {main="Tauret",sub="Genmei Shield",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Subtlety Spec.",ear1="Digni. Earring",ear2="Mache Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rajas Ring",ring2="Apate Ring",
		back="Xucau Mantle",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = {main="Tauret",sub="Blurred Knife +1",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW.Acc = {main="Tauret",sub="Blurred Knife +1",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 10)
end