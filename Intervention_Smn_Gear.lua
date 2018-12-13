-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Gridarvor staff','Khatvanga')

    gear.perp_staff = {name="Gridarvor staff"}
	
	gear.magic_jse_back = {name="Conveyance cape"}  -- "Campestre's cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Conveyance cape"}  -- "Campestres's cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic horn +1"}
    
    sets.precast.JA['Elemental Siphon'] = {main="Gridarvor staff",sub="Enki strap",ammo="Sancus sachet",  -- Espiritus,Vox grip,Esper stone +1,
        head="Beckoner horn +1",neck="Summoner's torque",ear1="Andoaa earring",ear2="Calamitous earring",  -- Telchine Cap,Incanter's torque,Gifted earring,
        body="Baayami robe",hands="Baayami cuffs",ring1="Evoker's ring",ring2="Stikini ring",  -- Telchine Chasuble,
        back="Conveyance cape",waist="Refoccilation stone",legs="Telchine braconi",feet="Beckoner's pigaches +1"}  -- Kobo Obi,

    sets.precast.JA['Mana Cede'] = {hands="Beckoner's bracers"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {main="Gridarvor staff",sub="Enki strap",ammo="Sancus sachet",  -- Espiritus,Vox grip,
		head="Beckoner's horn +1",neck="Summoner's torque",ear1="Andoaa earring",ear2="Caller's earring",  -- Incanter's torque,,Evans earring,
        body="Convoker's doublet +1",hands="Baayami cuffs",ring1="Evoker's ring",ring2="Stikini ring",  -- Convoker's doublet +3,
        back="Conveyance cape",waist="Refoccilation stone",legs="Baayami Slops",feet="Baayami Sabots"}  -- Kobo Obi,

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {main="Grioavolr staff",sub="Enki strap",ammo="Ombre tathlum +1",  -- Clerisy strap +1,Impatiens,
		head="Nahtirah hat",neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious earring",  -- Amalric Coif +1,
		body="Inyanga jubbah +1",hands="Amalric gages",ring1="Kishar ring",ring2="Lebeche ring",  -- Inyanga jubbah +2,Volte gloves,
		back="Swith cape",waist="Witful belt",legs="Lingo pants",feet="Regal pumps +1"}  -- Perimede cape,Psycloth Lappas,

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity staff",sub="Clerisy strap"})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel sash"})
	
    sets.precast.FC.stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body=empty})  -- Twilight cloak
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Sancus sachet",
        head="Beckoner's horn +1",neck="Sanctity necklace",ear1="Enchanter's earring +1",ear2="Calamitous earring",  -- Etiolation earring",ear2="Gifted earring",
        body="Convoker's doublet +1",hands=gear.merlinic_physpact_hands,ring1="Varar ring +1",ring2="Varar ring",  -- Regal cuffs,
        back="Conveyance cape",waist="Witful belt",legs="Lingo pants",feet="Beckoner's pigaches +1"}  -- Luminary sash,Psycloth Lappas,

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {main="Gridarvor staff",sub="Clerisy strap",ammo="Ombre tathlum +1",  -- Hasty Pinion +1
		head="Nahtirah hat",neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious earring",  -- Amalric Coif +1
		body="Inyanga jubbah +1",hands="Amalric gages",ring1="Kishar ring",ring2="Prolix ring",  -- Inyanga jubbah +1,Volte gloves,
		back="Swith cape +1",waist="Witful belt",legs="Lengo pants",feet="Regal pumps +1"}
	
    sets.midcast.Cure = {main="Serenity staff",sub="Curatio grip",ammo="Hydrocera",  -- Inyanga jubbah +2,Volte gloves,
        head="Nahtirah hat",neck="Noden's gorget",ear1="Mendicant's earring",ear2="Calamitous earring",  -- Vanya hood,Incanter's torque,Gifted earring,
        body="Baayami robe",hands="Serpentes cuffs",ring1="Haoma's ring",ring2="Lebeche ring",  -- Vrikodara Jupon,Telchine gloves,Janniston ring,Sirona's ring,
        back="Pahtli cape",waist="Witful belt",legs="Gyve Trousers",feet="Serpentes Sabots"}  -- Tempered cape +1,Austerity belt +1,Vanya Clogs
		
	sets.Self_Healing = {neck="Noden's gorget",ring1="Lebeche ring",ring2="Haoma's ring",waist="Witful belt"}
	sets.Cure_Received = {neck="Noden's gorget",ring1="Lebeche ring",ring2="Haoma's ring",waist="Witful belt"}
	sets.Self_Refresh = {back="Empty",waist="Witful belt",feet="Inspirited Boots"}  -- Grapevine cape,Gishdubar sash,
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",hands="Telchine gloves",  -- Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's ring",ring2="Ephedra ring", back="Pahtli cape",waist="Witful belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Serenity staff",sub="Clemency grip"})  -- Oranyan

	sets.midcast['Elemental Magic'] = {main="Gridarvor staff",sub="Enki strap",ammo="Dosis tathlum",  -- Zuuxowu grip,
        head="Psycloth tiara",neck="Adad amulet",ear1="Hecate's earring",ear2="Friomisi earring",  -- gear.merlinic_nuke_head,Baetyl pendant,Crematio earring
        body="Witching robe",hands="Amalric gages",ring1="Speaker's ring",ring2="Locus ring",  -- gear.merlinic_nuke_body,Amalric gages +1,Shiva ring +1,Shiva ring +1,
		back="Toro cape",waist="Witful belt",legs="Lengo pants",feet="Umbani Boots"}  -- Sekhmet corset,Merlinic Shalwar,gear.merlinic_nuke_feet
		
	sets.midcast['Elemental Magic'].Resistant = {main="Keraunos staff",sub="Enik strap",ammo="Dosis tathlum", -- Zuuxowu grip,
        head="Nahtirah a hat",neck="Sanctity necklace",ear1="Hecate's earring",ear2="Friomisi earring",  
        body="Witching robe",hands="Amalric gages",ring1="Shiva ring +1",ring2="Locus ring",  -- gear.merlinic_nuke_body,Shiva ring +1,Shiva ring +1,
		back="Toro cape",waist="Witful belt",legs="Lengo pants",feet="Umbani Boots"}  -- Sekhmet corset,Merlinic Shalwar,gear.merlinic_nuke_feet
		
    sets.midcast['Elemental Magic'].OccultAcumen = {}  -- {main="Khatvanga",sub="Bloodrain strap",ammo="Seraphic Ampulla",
        -- head=gear.merlinic_nuke_head,neck="Combatant's torque",ear1="Dedition earring",ear2="Telos earring",
        -- body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas ring",ring2="Petrov ring",
        -- back="Toro cape",waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
	sets.midcast.Impact = {}  -- {main="Oranyan",sub="Enki strap",ammo="Pemphredo tathlum",
		-- head=empty,neck="Erra pendant",ear1="Enchanter earring +1",ear2="Gwati earring",
		-- body="Twilight cloak",hands="Regal cuffs",ring1="Stikini ring",ring2="Stikini ring",
		-- back="Toro cape",waist="Acuity belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="empty"})  -- Twilight cloak

    sets.midcast['Divine Magic'] = {main="Serenity staff",sub="Clemency grip",ammo="Dosis tathlum",  -- Oranyan,Zuuxowu grip,
        head="Nahtirah hat",neck="Noden's gorget",ear1="Hecate's earring",ear2="Friomisi earring",  -- gear.merlinic_nuke_head,Baetyl pendant,Crematio earring
        body="Witching robe",hands="Amalric gages",ring1="Shiva ring +1",ring2="Locus ring",  -- gear.merlinic_nuke_body,Shiva ring +1,Shiva ring +1,
		back="Toro cape",waist="Witful belt",legs="Lengo pants",feet="Umbani Boots"}  -- Sekhmet corset,Merlinic Shalwar,gear.merlinic_nuke_feet
		
    sets.midcast['Dark Magic'] = {main="Keraunas staff",sub="Enki strap",ammo="Ombre tathlum +1",  -- Ammurapi Shield,Pemphredo tathlum,
        head="Pixie Hairpin +1",neck="Erra pendant",ear1="Dignitary's earring",ear2="Gwati earring",  -- gear.merlinic_nuke_head,Incanter's torque,
        body="Witching robe",hands="Amalric gages",ring1="Stikini ring",ring2="Stikini ring",  -- gear.merlinic_nuke_body,
        back="Toro cape",waist="Refoccilation stone",legs="Lengo pants",feet="Umbani Boots"}  -- Aurist's cape +1,Yamabuki-no-Obi,Merlinic Shalwar,gear.merlinic_aspir_feet
	
	sets.midcast.Drain = {main="Keraunas staff",sub="Enki strap",ammo="Ombre tathlum +1",  -- Ammurapi Shield,Pemphredo tathlum,
        head="Pixie Hairpin +1",neck="Erra pendant",ear1="Dignitary's earring",ear2="Gwati earring",  -- Incanter's torque,
        body="Witching robe",hands="Amalric gages",ring1="Archon ring",ring2="Evanescence ring",  -- gear.merlinic_nuke_body,Evanescence ring,
        back="Thaumaturge's cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Umbani Boots"}  -- Aurist's cape +1,Merlinic Shalwar,gear.merlinic_aspir_feet
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {}  -- {main="Oranyan",sub="Clerisy strap +1",ammo="Hasty Pinion +1",
		-- head="Amalric Coif +1",neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious earring",
		-- body="Inyanga jubbah +2",hands="Volte gloves",ring1="Kishar ring",ring2="Stikini ring",
		-- back="Swith cape +1",waist="Witful belt",legs="Psycloth Lappas",feet="Regal pumps +1"}
		
    sets.midcast.Stun.Resistant = {}  -- {main="Oranyan",sub="Clerisy strap +1",ammo="Hasty Pinion +1",
		-- head="Amalric Coif +1",neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Gwati earring",
		-- body="Inyanga jubbah +2",hands="Volte gloves",ring1="Kishar ring",ring2="Stikini ring",
		-- back="Aurist's cape +1",waist="Witful belt",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}
		
	sets.midcast['Enfeebling Magic'] = {main="Keraunos staff",sub="Enki strap",ammo="Ombre tathlum +1",  -- Oranyan,Pemphredo tathlum,
		head="Inyanga tiara +1",neck="Erra pendant",ear1="Dignitary's earring",ear2="Gwati earring",  -- Befouled Crown
		body="Witching robe",hands=gear.merlinic_magpact_hands,ring1="Kishar ring",ring2="Stikini ring",  -- gear.merlinic_nuke_body,Regal cuffs
		back="Thaumaturge cape",waist="Eschan stone",legs="Lengo pants",feet="Umbani Boots"}  -- Aurist's cape +1,Luminary sash,Psycloth Lappas,Uk'uxkaj Boots
		
	sets.midcast['Enfeebling Magic'].Resistant = {}  -- {main="Oranyan",sub="Clerisy strap +1",ammo="Pemphredo tathlum",
		-- head="Befouled Crown",neck="Erra pendant",ear1="Dignitary's earring",ear2="Gwati earring",
		-- body=gear.merlinic_nuke_body,hands="Regal cuffs",ring1="Stikini ring",ring2="Stikini ring",
		-- back=gear.nuke_jse_back,waist="Luminary sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {main="Serenity staff",sub="Clemency strap",ammo="Hydrocera",  -- gear.gada_enhancing_club,Ammurapi Shield,Hasty Pinion +1,
		head="Nahtirah hat",neck="Colossus's torque",ear1="Andoaa earring",ear2="Calamitous earring",  -- Telchine Cap,Incanter's torque,Gifted earring,
		body="Shango robe",hands="Inyanga dastanas +1",ring1="Stikini ring",ring2="Stikini ring",  -- Telchine Chas.,Telchine gloves,
		back="Swith cape +1",waist="Olympus sash",legs="Assiduity pants +1",feet="Baayami Sabots"}  -- Perimede cape,Telchine braconi,Telchine pigaches
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Beckoner's horn +1"})  -- Amalric Coif +1
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Serenity staff",sub="Clemency grip",body="Respite cloak",hands="Asteria Mitts +1",waist="Fucho-no-Obi",legs="Assiduity pants +1"})  -- Vadose Rod,Genmei Shield,Amalric Coif +1,Regal cuffs,Emphatikos Rope,Shedir Seraweels
    sets.midcast.stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Noden's gorget",ear2=empty,waist="Siegel sash",legs="Assiduity pants +1"})  -- Earthcry earring,Shedir Seraweels
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Assiduity pants +1"})  -- Shedir Seraweels

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {main="Keraunas staff",sub="Enki strap",ammo="Sancus sachet",  -- Espiritus,Vox grip,
        head="Beckoner's horn +1",neck="Caller's pendant",ear1="Andoaa earring",ear2="Calamitous earring",  -- Incanter's torque,Gifted earring
        body="Beckoner's doublet +1",hands="Baayami cuffs",ring1="Evoker's ring",ring2="Stikini ring",  
        back="Conveyance cape",waist="Witful belt",legs="Baayami Slops",feet="Baayami Sabots"}  -- Kobo Obi,

    sets.midcast.Pet.DebuffBloodPactWard = {main="Keraunos staff",sub="Enki strap",ammo="Sancus sachet",  -- Espiritus,Vox grip,Sancus sachet +1
        head="Beckoner's horn +1",neck="Adad amulet",ear1="Andoaa earring",ear2="Enmerkar earring",
        body="Beckoner's doublet +1",hands=gear.merlinic_magpact_hands,ring1="Evoker's ring",ring2="Stikini ring",
        back="Conveyance cape",waist="Incarnation sash",legs="Enticer's's pants",feet="Beckoner's pigaches +1"}  -- gear.magic_jse_back,Tali'ah Sera. +2
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor staff",sub="Enki strap",ammo="Sancus sachet",  -- Sancus sachet +1
        head="Psycloth tiara",neck="Caller's pendant",ear1="Gelos earring",ear2="Enmerkar earring",  -- Helios Band,Shulmanu Collar,Lugalbanda earring,
        body="Convoker's doublet +1",hands=gear.merlinic_physpact_hands,ring1="Varar ring +1",ring2="Varar ring",  -- Convoker's doublet +3,
        back="Conveyance cape",waist="Incarnation sash",legs="Enticer's's pants",feet="Inyanga crackows +1"}  -- gear.phys_jse_back,Apogee Slacks +1,Apogee pumps +1
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {feet="Convoker's pigaches +1"}  -- Convoker's pigaches +3

    sets.midcast.Pet.MagicalBloodPactRage = {main="Gridarvor staff",sub="Enki strap",ammo="Sancus sachet",  -- Sancus sachet +1
        head="Psycloth tiara",neck="Adad amulet",ear1="Gelos earring",ear2="Enmerkar earring",  -- Apogee Crown +1,Lugalbanda earring
        body="Convoker's doublet +1",hands=gear.merlinic_magpact_hands,ring1="Varar ring +1",ring2="Varar ring",  -- Convoker's doublet +3,
        back="Conveyance cape",waist="Incarnation sash",legs="Enticer's's pants",feet="Inyanga crackows +1"}  -- gear.magic_jse_back,Regal belt,Apogee pumps +1

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {feet="Convoker's pigaches +1"}  -- Convoker's pigaches +3

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Glyphic Spats +1"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Glyphic Spats +1"})

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Flaming Crush'] = {main="Gridavor staff",sub="Enki strap",ammo="Sancus sachet",  -- Sancus sachet +1
        head="Psycloth tiara",neck="Adad amulet",ear1="Gelos earring",ear2="Enmerkar earring",  -- Apogee Crown +1,Lugalbanda earring,
        body="Convoker's doublet +1",hands=gear.merlinic_magpact_hands,ring1="Varar ring +1",ring2="Varar ring",  -- Convoker's doublet +3,
        back="Conveyance cape",waist="Incarnation sash",legs="Enticer's's pants",feet="Inyanga crackows +1"}  -- gear.phys_jse_back,Regal belt,Apogee Slacks +1,Apogee pumps +1,
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convoker's pigaches +1"}  -- Convoker's pigaches +3
	
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's's pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's's pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's's pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's's pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's's pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's's pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's's pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's's pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's's pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's's pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Chatoyant staff",ammo="Sancus sachet",  -- Staunch tathlum
        head="Beckoner's horn +1",neck="Eidonlon pendant +1",ear1="Moonshade earring",ear2="Ethereal earring",  -- Loricate torque +1,Etiolation earring,
        body="Shomonjijoe +1",hands="Wayfarer cuffs",ring1="Defending ring",ring2="Sheltered ring",  -- hands=gear.merlinic_refresh_hands,
        back="Conveyance cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Baayami Sabots"}  -- Umbra cape,
    
    -- Idle sets
    sets.idle = {main="Chatoyant staff",sub=empty,ammo="Sancus sachet",  -- Bolelabunga,Genmei Shield,Staunch tathlum,
        head="Beckoner's horn +1",neck="Eidonlon pendant",ear1="Moonshade earring",ear2="Ethereal earring",  -- Loricate torque +1,Etiolation earring,
        body="Shomonjijoe +1",hands="Wayfarer cuffs",ring1="Defending ring",ring2="Gelatinous ring +1",  -- gear.merlinic_refresh_hands
        back="Conveyance cape",waist="Fucho-no-Obi",legs="Assiduity pants +1",feet="Baayami Sabots"}  -- Umbra cape

    sets.idle.PDT = {}  -- {main="Terra's staff",sub="Oneiros grip",ammo="Staunch tathlum",
        -- head="Hagondes hat +1",neck="Loricate torque +1",ear1="Etiolation earring",ear2="Ethereal earring",
        -- body="Vrikodara Jupon",hands="Hagondes cuffs +1",ring1="Defending ring",ring2="Dark ring",
        -- back="Umbra cape",waist="Regal belt",legs="Hagondes pants +1",feet="Battlecast gaiters"}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck=empty})  -- Chrys. torque

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor staff: -5
    -- Glyphic horn: -4
    -- Caller's doublet +2/Glyphic doublet: -4
    -- Evoker's ring: -1
    -- Convoker's pigaches +1: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main="Chatoyant staff",sub="Enki strap",ammo="Sancus sachet",  -- Oneiros grip,Sancus sachet +1
        head="Beckoner's horn +1",neck="Caller's pendant",ear1="Moonshade earring",ear2="Ethereal earring",  -- Etiolation earring,Evans earring,
        body="Shomonjijoe +1",hands="Wayfarer cuffs",ring1="Evoker's ring",ring2="Gelatinous ring +1",  -- gear.merlinic_refresh_hands,
        back="Conveyance cape",waist="Fucho-no-Obi",legs="Assiduity pants +1",feet="Convoker's pigaches"}  -- Lucidity sash,Convoker's pigaches +3
		
    sets.idle.PDT.Avatar = {main="Chatoyant staff",sub="ENki strap",ammo="Sancus sachet",  -- Terra's staff,Oneiros grip,Sancus sachet +1,
        head="Beckoner's horn +1",neck="Caller's pendant",ear1="Moonshade earring",ear2="Ethereal earring",  -- Loricate torque +1,Etiolation earring,Evans earring,
        body="Shomonjijoe +1",hands="Wayfarer cuffs",ring1="Defending ring",ring2="Gelatinous ring +1",  -- gear.merlinic_refresh_hands,
        back="Conveyance cape",waist="Fucho-no-Obi",legs="Assiduity pants +1",feet="Convoker's pigaches"}  -- Umbra cape,Regal belt,Convoker's pigaches +3,

    sets.idle.Spirit = {main="Gridarvor staff",sub="Enki strap",ammo="Sancus sachet",  -- Oneiros grip,Sancus sachet +1
        head="Beckoner's horn +1",neck="Caller's pendant",ear1="Moonshade earring",ear2="Ethereal earring",  -- Etiolation earring,
        body="Shomonjijoe +1",hands="Wayfarer cuffs",ring1="Evoker's ring",ring2="Sheltered ring",  -- gear.merlinic_refresh_hands
        back="Conveyance cape",waist="Fucho-no-Obi",legs="Assiduity pants +1",feet="Convoker's pigaches"}  -- Lucidity sash,Convoker's pigaches +3,
		
    sets.idle.PDT.Spirit = {main="Gridarvor staff",sub="ENKi strap",ammo="Sancus sachet",  -- Oneiros grip,Sancus sachet +1,
        head="Beckoner's horn +1",neck="Caller's pendant",ear1="Moonshade earring",ear2="Ethereal earring",  -- Loricate torque +1,Etiolation earring,Evans earring,
        body="Shomonjijoe +1",hands="Wayfarer cuffs",ring1="Defending ring",ring2="Gelatinous ring +1",  -- gear.merlinic_refresh_hands,
        back="Conveyance cape",waist="Fucho-no-Obi",legs="Assiduity pants +1",feet="COnvoker's pigaches"}  -- Umbra cape,Lucidity sash,Battlecast gaiters,
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {neck="Caller's pendant"})  -- Chrys. torque
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Convoker's feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {}  --{main="Terra's staff",sub="Umbra strap",ammo="Sancus sachet +1",
         -- head="Hagondes hat +1",neck="Loricate torque +1",ear1="Handler's earring +1",ear2="Enmerkar earring",
         -- body="Vrikodara Jupon",hands="Hagondes cuffs +1",ring1="Defending ring",ring2="Dark ring",
         -- back="Umbra cape",waist="Regal belt",legs="Hagondes pants +1",feet="Battlecast gaiters"}

    sets.defense.MDT = {}  -- {main="Terra's staff",sub="Umbra strap",ammo="Sancus sachet +1",
         -- head="Hagondes hat +1",neck="Loricate torque +1",ear1="Etiolation earring",ear2="Lugalbanda earring",
         -- body="Vrikodara Jupon",hands="Hagondes cuffs +1",ring1="Defending ring",ring2="Dark ring",
         -- back="Umbra cape",waist="Regal belt",legs="Hagondes pants +1",feet="Battlecast gaiters"}

    sets.defense.MEVA = {} -- {main="Terra's staff",sub="Enki strap",ammo="Sancus sachet +1",
         -- head="Amalric Coif +1",neck="Warder's Charm +1",ear1="Sanare earring",ear2="Lugalbanda earring",
		 -- body="Inyanga jubbah +2",hands="Telchine gloves",ring1="Vengeful ring",ring2="Purity ring",
         -- back="Aurist's cape +1",waist="Luminary sash",legs="Telchine braconi",feet="Telchine pigaches"}
		
    sets.Kiting = {feet="Herald's gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {head="Psycloth tiara",ear1="Mendicant's earring",ear2="Ethereal earring",  -- Apogee Crown +1,Evans earring,
		body="Respite cloak",hands="Telchine gloves",ring1=empty,ring2=empty,  -- Seidr Cotehardie,Hieros Mittens
		back="Swith cape +1",waist= "Fucho-no-Obi",legs="Enticer's pants",feet="Inyanga crackows +1"}  -- Apogee Slacks +1,Apogee pumps +1,
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck=empty}  -- Sacrifice torque

	-- Weapons sets
	sets.weapons.Gridarvor = {main="Gridarvor staff", sub="Enki strap"}
	sets.weapons.Khatvanga = {main=empty,sub=empty}  -- Khatvanga,Enki strap,
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Gridarvor staff",sub="Enki strap",ammo="Sancus sachet",
        head="Beckoner's horn +1",neck="Caller's pendant",ear1="Dignitary's earring",ear2="Enervating earring",  -- Shulmanu Collar,Telos earring,
        body="Convoker's doublet +1",hands="Amalric gages",ring1="Ramuh ring +1",ring2="Ramuh ring +1",  -- Convoker's doublet +3,Gazu Bracelet +1,
        back="Conveyance cape",waist="Incarnation sash",legs="Assiduity pants +1",feet="Convoker's pigaches"}  -- gear.phys_jse_back,Olseni belt,Convoker's pigaches +3,
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(4, 17)
end