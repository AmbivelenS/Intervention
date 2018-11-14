function get_sets()

	send_command('bind f9 gs c toggle TP set')
	send_command('bind f10 gs c toggle Idle set')
	send_command('bind f11 gs c toggle Res set')
	send_command('bind f12 gs c toggle Dim set')
	send_command('bind ^f11 gs c toggle Req set')
	
	function file_unload()
      
 
        send_command('unbind ^f9')
        send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
		send_command('unbind !f11')
        send_command('unbind !f12')
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
 
       
 
	end
		

		--Idle Sets--
		sets.Idle = {}
		
		sets.Idle.index = {'Standard', 'DT'}
		Idle_ind = 1
				
		sets.Idle.Standard = {ammo="Homiliary",
							  head="Ocelomeh headpiece +1",neck="Bathy choker", ear1="Ethereal earring",ear2="infused earring",
							  body="Futhark coat +1",hands="Erilaz gauntlets +1",ring1="Defending ring",ring2="Sheltered ring",
							  back="Shadow mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}
							  
		sets.Idle.DT = {ammo="Staunch tathlum",
					  head="Fu. bandeau +1",neck="Twilight torque", ear1="Ethereal earring", ear2="infused earring",
					  body="Erilaz surcoat +1",hands="Buremte Gloves",ring1="Defending ring",ring2="Dark ring",
					  back="Shadow Mantle",waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
							  
		sets.Idle.Leech = {ammo="Homiliary",
						   head="Fu. bandeau +1",neck="Bathy choker", ear1="Ethereal earring",
						   body="Futhark coat +1",hands="Erilaz gauntlets +1",ring1="Defending ring",ring2="Trizek ring",
						   back="Aptitude mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}
			
	
		
				
				
				
		--TP Sets--
		sets.TP = {}

		sets.TP.index = {'Standard', 'Solo', 'AccuracyLite', 'AccuracyFull', 'AccuracyExtreme', 'DT', 'DTAccuracy'}
		--1=Standard, 2=AccuracyLite, 3=AccuracyFull, 4=DT, 5=DTAccuracy--
		TP_ind = 1
	
		sets.TP.Standard = 
			{
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Attack+28','"Triple Atk."+4','DEX+10',}},
			legs={ name="Herculean Trousers", augments={'Attack+22','"Triple Atk."+4','AGI+9','Accuracy+2',}},
			feet={ name="Herculean Boots", augments={'Accuracy+23','"Triple Atk."+3','AGI+10',}},
			neck="Asperity Necklace",
			waist="Grunfeld Rope",
			left_ear="Brutal Earring",
			left_ring="Apate Ring",
			right_ring="Rajas Ring",
			back="Atheling Mantle",
			}				
		sets.TP.Solo = {ammo="Ginsen",
						head="Herculean helm",neck="Lissome necklace", ear1="Brutal earring", ear2="Cessance earring",
						body="Adhemar jacket",hands="Adhemar wristbands",ring1="Epona's ring",ring2="Petrov ring",
						back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Windbuffet Belt +1",legs={ name="Herculean Trousers", augments={'Attack+26','"Triple Atk."+4','AGI+10','Accuracy+13',}},feet={ name="Herculean Boots", augments={'"Triple Atk."+4','Accuracy+5',}}}
							
		sets.TP.AccuracyLite = {ammo="Ginsen",
								head="Skormoth mask",neck="Lissome necklace", ear1="Brutal earring", ear2="Cessance earring",
								body="Adhemar jacket",hands="Adhemar wristbands",ring1="Epona's ring",ring2="Petrov ring",
								back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Windbuffet Belt +1",legs={ name="Herculean Trousers", augments={'Attack+26','"Triple Atk."+4','AGI+10','Accuracy+13',}},feet={ name="Herculean Boots", augments={'"Triple Atk."+4','Accuracy+5',}}}
	
		sets.TP.AccuracyFull = {ammo="Falcon Eye",
								head="Skormoth mask",neck="Subtlety Spec.", ear1="Brutal earring", ear2="Cessance earring",
								body="Adhemar jacket",hands="Adhemar wristbands",ring1="Epona's ring",ring2="Petrov ring",
								back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Windbuffet belt +1",legs={ name="Herculean Trousers", augments={'Attack+26','"Triple Atk."+4','AGI+10','Accuracy+13',}},feet="Carmine Greaves +1"}
								
		sets.TP.AccuracyExtreme = {ammo="Falcon Eye",
								   head="Skormoth mask",neck="Subtlety Spec.", ear1="Brutal earring", ear2="Cessance earring",
								   body="Adhemar jacket",hands="Adhemar wristbands",ring1="Epona's ring",ring2="Petrov ring",
							       back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Hurch'lan sash",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
							
		sets.TP.DT = {
					ammo="Staunch tathlum",
					head={ name="Futhark Bandeau", augments={'Enhances "Battuta" effect',}},
					body="Erilaz Surcoat",
					hands="Aya. Manopolas",
					legs="Eri. Leg Guards +1",
					feet="Erilaz Greaves +1",
					neck="Twilight Torque",
					waist="Grunfeld Rope",
					left_ear="Brutal Earring",
					right_ear="Cessance Earring",
					left_ring="Gelatinous Ring +1",
					right_ring="Meridian Ring",
					back="Atheling Mantle",
					  
					  }
				  
		sets.TP.DTAccuracy = {ammo="Staunch tathlum",
							  head="Skormoth mask",neck="Twilight torque", ear1="Ethereal earring", ear2="Genmei earring",
							  body="Erilaz surcoat +1",hands="Buremte Gloves",ring1="Defending ring",ring2="Warden's ring",
					          back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
							  
							  
							  
							  
							  
							  
		--Weaponskill Sets--
		sets.WS = {}
	
		sets.Resolution = {}
	
		sets.Resolution.index = {'Attack','Accuracy'}
		Resolution_ind = 1
	
		sets.Resolution.Attack = {ammo="Seething bomblet +1",
						     	  head="Adhemar bonnet",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
								  body="Adhemar jacket",hands="Meg. gloves +1",ring1="Epona's ring",ring2="Ifrit ring",
								  back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Fotia belt",legs={ name="Herculean Trousers", augments={'Attack+26','"Triple Atk."+4','AGI+10','Accuracy+13',}},feet={ name="Herculean Boots", augments={'Attack+18','Weapon skill damage +3%','STR+15','Accuracy+6',}}}
								  
		sets.Resolution.Accuracy = {ammo="Seething bomblet +1",
						     	    head="Adhemar bonnet",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
								    body="Adhemar jacket",hands="Meg. gloves +1",ring1="Epona's ring",ring2="Ifrit ring",
								    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Store TP"+10',}},waist="Fotia belt",legs={ name="Herculean Trousers", augments={'Attack+26','"Triple Atk."+4','AGI+10','Accuracy+13',}},feet={ name="Herculean Boots", augments={'Attack+18','Weapon skill damage +3%','STR+15','Accuracy+6',}}}
									
		sets.Dimidiation = {}
	
		sets.Dimidiation.index = {'Attack','Accuracy'}
		Dimidiation_ind = 1
	
		sets.Dimidiation.Attack = {ammo="Seething bomblet +1",
						     	   head="Adhemar bonnet",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
								   body="Adhemar jacket",hands="Meg. gloves +1",ring1="Epona's ring",ring2="Rajas ring",
								   back={ name="Ogma's cape", augments={'DEX+20','Accuracy+17 Attack+17','Weapon skill damage +10%',}},waist="Fotia belt",legs={ name="Herculean Trousers", augments={'Crit. hit damage +2%','DEX+12','Attack+10',}},feet={ name="Herculean Boots", augments={'Attack+18','Weapon skill damage +3%','STR+15','Accuracy+6',}}}
								  
		sets.Dimidiation.Accuracy = {ammo="Seething bomblet +1",
						     	   head="Adhemar bonnet",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
								   body="Adhemar jacket",hands="Meg. gloves +1",ring1="Epona's ring",ring2="Rajas ring",
								   back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Fotia belt",legs={ name="Herculean Trousers", augments={'Crit. hit damage +2%','DEX+12','Attack+10',}},feet="Meg. Jam. +1"}
							 
		sets.Requiescat = {}
	
		sets.Requiescat.index = {'Attack','Accuracy'}
		Requiescat_ind = 1
		
		sets.Requiescat.Attack = {ammo="Potestas bomblet",
							  	  head="Whirlpool mask",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
								  body="Manibozho jerkin",hands="Umuthi gloves",ring1="Epona's ring",ring2="Aquasoul ring",
								  back="Atheling mantle",waist="Fotia belt",legs="Quiahuiz trousers",feet="Meg. Jam. +1"}
								  
		sets.Requiescat.Accuracy = {ammo="Honed tathlum",
									head="Whirlpool mask",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
									body="Manibozho jerkin",hands="Umuthi gloves",ring1="Epona's ring",ring2="Aquasoul ring",
									back="Letalis mantle",waist="Fotia belt",legs="Quiahuiz trousers",feet="Meg. Jam. +1"}
									  
									  
									  
									  
									  
									  
		--Utility Sets--
		sets.Utility = {}
		
		sets.Utility.PDT = {ammo="Staunch Tathlum",
							head="Fu. bandeau +1",neck="Twilight torque", ear1="Ethereal earring",
							body="Futhark coat +1",hands="Buremte Gloves",ring1="Defending ring",ring2="Warden's ring",
							back="Shadow mantle",waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
						
		sets.Utility.MDT = {ammo="Staunch tathlum",
						    head="Haruspex hat",neck="Warder's charm +1",
							body="Futhark coat +1",hands="Erilaz gauntlets +1",ring1="Defending ring",ring2="Shadow ring",
						    back="Mollusca mantle",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
							
		sets.Utility.Enhancing = {head="Erilaz galea",neck="Colossus's torque",ear1="Andoaa earring",ear2="Augment. earring",
								  body="Manasa chasuble",hands="Runeist mitons",ring1="Prolix ring",ring2="Weather. ring",
								  back="Merciful cape",waist="Olympus sash",legs="Carmine cuisses +1",feet="Erilaz Greaves +1"}
							
		sets.Utility.Stoneskin = {head="Runeist bandeau",neck="Stone Gorget",ear1="Loquac. earring",ear2="Earthcry earring",
								  body="Futhark coat +1",hands="Stone Mufflers",ring1="Prolix ring",ring2="Weather. ring",
								  back="Merciful cape",waist="Siegel sash",legs="Haven hose",feet="Erilaz Greaves +1"}
							  
		sets.Utility.Phalanx = {head="Fu. bandeau +1",neck="Colossus's torque",ear1="Andoaa earring",ear2="Augment. earring",
								body="Manasa chasuble",hands="Runeist mitons",ring1="Prolix ring",ring2="Weather. ring",
								back="Merciful cape",waist="Olympus sash",legs="Carmine cuisses +1",feet="Erilaz Greaves +1"}
							  
		sets.Utility.Regen = {head="Runeist bandeau",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
							  body="Futhark coat +1",hands="Runeist mitons",ring1="Prolix ring",ring2="Weather. ring",
							  back="Merciful cape",waist="Cascade belt",legs="Futhark trousers +1",feet="Erilaz Greaves +1"}
							  
		sets.Utility.Refresh = {head="Erilaz galea",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
							    body="Futhark coat +1",hands="Runeist mitons",ring1="Prolix ring",ring2="Weather. ring",
							    back="Merciful cape",waist="Cascade belt",legs="Futhark trousers +1",feet="Erilaz Greaves +1"}
							  
		sets.Utility.Utsusemi = {head="Runeist bandeau",neck="Jeweled collar",ear1="Loquac. earring",ear2="Friomisi earring",
								 body="Futhark coat +1",hands="Thaumas gloves",ring1="Prolix ring",ring2="Weather. ring",
								 waist="Hurch'lan sash",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
		
		sets.Utility.Defense = {head="Erilaz galea",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
							    body="Futhark coat +1",hands="Runeist mitons",ring1="Prolix ring",ring2="Sheltered ring",
							    back="Merciful cape",waist="Cascade belt",legs="Futhark trousers +1",feet="Erilaz Greaves +1"}
								 
		sets.Utility.Enmity = {ammo="Aqreaqa bomblet",
							   head="Rabid visor",neck="Warder's charm +1",ear1="Friomisi earring",ear2="Loquac. earring",
							   body="Emet harness +1",hands="Futhark mitons",ring1="Provocare ring",ring2="Petrov ring",
							   back="Evasionist's cape",waist="Goading belt",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
								 
						
				
				
				
				
				
		--Job Ability Sets--
		sets.JA = {}
		
		sets.JA.Lunge = {ammo="Seething bomblet +1",
						 head="Herculean helm",neck="Eddy necklace",lear="Hecate's earring",rear="Friomisi earring",
						 body="Count's garb",hands="Leyline gloves",ring1="Acumen ring",
						 back="Evasionist's cape",waist="Eschan stone",legs="Shned. tights +1",feet="Herculean Boots"}
	
		sets.JA.Vallation = {body="Runeist coat",
							 legs="Futhark trousers",
							 back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Store TP"+10',}}}
							 
		sets.JA.Battuta = {head="Fu. bandeau +1"}
	
		sets.JA.Gambit = {hands="Runeist mitons"}
	
		sets.JA.Pflug = {head="Runeist bottes"}
		
		sets.JA.Embolden = {head="Erilaz galea",
						    back="Evastionist's cape",legs="Futhark trousers +1"}
		
		sets.JA.VivPulse = {head="Erilaz galea"}
		
		sets.JA.Liement = {body="Futhark coat +1"}
		
		sets.JA.EleSforzo = {body="Futhark coat +1"}
		
		sets.JA.Swordplay = {hands="Futhark mitons"}
		
		
		
		
		
		
		--Precast Sets--
		sets.precast = {}
	
		sets.precast.FC = {}
	
		sets.precast.FC.Standard = {ammo="Sapience orb",
									head="Runeist bandeau",neck="Orunmila's torque", ear1="Loquac. Earring",
								    body="Mirke wardecors",hands="Leyline gloves",ring1="Prolix ring",ring2="Weather. ring",
									legs="Orvail pants +1",feet="Carmine Greaves +1"}
									
		sets.precast.FC.Enhancing = {ammo="Sapience orb",
									 head="Runeist bandeau",neck="Orunmila's torque", ear1="Loquac. Earring",
								     body="Mirke wardecors",hands="Leyline gloves",ring1="Prolix ring",ring2="Weather. ring",
									 waist="Siegel Sash",legs="Futhark trousers +1",feet="Carmine Greaves +1"}
end



		
		
		
function precast(spell)
	if spell.skill == 'Divine Magic' then
		equip(sets.precast.FC.Standard)
	end
	
	if spell.skill == 'Healing Magic' then
		equip(sets.precast.FC.Standard)
	end
	
	if spell.skill == 'Blue Magic' then
		equip(sets.precast.FC.Standard)
	end
	
	if spell.skill == 'Enhancing Magic' then
		equip(sets.precast.FC.Enhancing)
	end
	
	if spell.skill == 'Ninjutsu' then
		equip(sets.precast.FC.Standard)
	end
	
	if spell.skill == 'Trust' then
		equip(sets.precast.FC.Standard)
	end
	
	if spell.english == 'Lunge' or spell.english == 'Swipe' or spell.english == "Onca Suit" or spell.english == "Meteor" then 
		equip(sets.JA.Lunge)
	end
	
	if spell.english == 'Vallation' or spell.english == 'Valiance' then
		equip(sets.JA.Vallation)
	end
	
	if spell.english == 'Battuta' then
		equip(sets.JA.Battuta)
	end
	
	if spell.english == 'Pflug' then
		equip(sets.JA.Pflug)
	end
	
	if spell.english == 'Gambit' then
		equip(sets.JA.Gambit)
	end
	
	if spell.english == 'Embolden' then
		equip(sets.JA.Embolden)
	end
	
	if spell.english == 'Vivacious Pulse' then
		equip(sets.JA.VivPulse)
	end
	
	if spell.english == 'Liement' then
		equip(sets.JA.Liement)
	end
	
	if spell.english == 'Elemental Sforzo' then
		equip(sets.JA.EleSforzo)
	end
	
	if spell.english == 'Swordplay' then
		equip(sets.JA.Swordplay)
	end
		
	if spell.english == 'Resolution' or spell.english == 'Shockwave' or spell.english == 'Spinning Slash' or spell.english == 'Ground Strike' then
		equip(sets.Resolution[sets.Resolution.index[Resolution_ind]])
	end
	
	if spell.english == 'Dimidiation' then
		equip(sets.Dimidiation[sets.Dimidiation.index[Dimidiation_ind]])
	end
	
	if spell.english == 'Requiescat' then
		equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
	end
end		

function midcast(spell,act)
	if spell.skill == 'Enhancing Magic' then
		equip(sets.Utility.Enhancing)
			if buffactive['Embolden'] then
				equip(sets.JA.Embolden)
			end
	end
	
	if spell.english == 'Stoneskin' then
		equip(sets.Utility.Stoneskin)
			    if buffactive['Stoneskin'] then
				send_command('@wait 0.7; input //cancel Stoneskin; input /echo Refreshing Stoneskin.')
				end
	end
	
	if spell.english == 'Phalanx' then
		equip(sets.Utility.Phalanx)
			if buffactive['Embolden'] then
				equip(sets.JA.Embolden)
			end
			if spell.english == 'Temper' then
				equip({head="Erilaz galea"})
			end
	end
	
	if spell.english == 'Regen IV' then
		equip(sets.Utility.Regen)
			if buffactive['Embolden'] then
				equip(sets.JA.Embolden)
			end
	end
	
	if spell.english == 'Refresh' then
		equip(sets.Utility.Refresh)
			if buffactive['Embolden'] then
				equip(sets.JA.Embolden)
			end
	end
	
	if spell.english == 'Protect IV' or spell.english == 'Shell V' then
		equip(sets.Utility.Defense)
			if buffactive['Embolden'] then
				equip(sets.JA.Embolden)
			end
	end	
	
	if spell.english == 'Flash' or spell.english == 'Foil' or spell.english == 'Valiance' or spell.english == 'Vallation' or spell.english == 'One For All' or spell.english == 'Swordplay' or spell.english == 'Battuta' or spell.english == 'Pflug' or spell.english == 'Rune Enchantment' or spell.english == 'Embolden' or spell.english == 'Liement' or spell.skill == 'Blue Magic' then
		equip(sets.Utility.Enmity)
	end
	
	if spell.english == 'Utsusemi: Ichi' then
		equip(sets.Utility.Utsusemi)
			if buffactive['Copy Image (3)'] then
				send_command('@wait 0.3; input //cancel Copy Image (3)')
			end
			if buffactive['Copy Image (2)'] then
				send_command('@wait 0.3; input //cancel Copy Image (2)')
			end
			if buffactive['Copy Image (1)'] then
				send_command('@wait 0.3; input //cancel Copy Image (1)')
			end
			if buffactive['Copy Image'] then
				send_command('@wait 0.3; input //cancel Copy Image')
			end
	end
	
	if spell.english == 'Utsusemi: Ni' then
		equip(sets.Utility.Utsusemi)
	end
	
	if spell.english == 'Vallation' or spell.english == 'Valiance' then
		equip(sets.JA.Vallation)
	end
	
	if spell.english == 'Battuta' then
		equip(sets.JA.Battuta)
	end
	
	if spell.english == 'Pflug' then
		equip(sets.JA.Pflug)
	end
	
	if spell.english == 'Gambit' then
		equip(sets.JA.Gambit)
	end
	
	if spell.english == 'Embolden' then
		equip(sets.JA.Embolden)
	end
	
	if spell.english == 'Vivacious Pulse' then
		equip(sets.JA.VivPulse)
	end
	
	if spell.english == 'Liement' then
		equip(sets.JA.Liement)
	end
	
	if spell.english == 'Elemental Sforzo' then
		equip(sets.JA.EleSforzo)
	end
	
	if spell.english == 'Swordplay' then
		equip(sets.JA.Swordplay)
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind +1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'toggle Res set' then
		Resolution_ind = Resolution_ind +1
		if Resolution_ind > #sets.Resolution.index then Resolution_ind = 1 end
		send_command('@input /echo <----- Resolution set changed to '..sets.Resolution.index[Resolution_ind]..' ----->')
	elseif command == 'toggle Dim set' then
		Dimidiation_ind = Dimidiation_ind +1
		if Dimidiation_ind > #sets.Dimidiation.index then Dimidiation_ind = 1 end
		send_command('@input /echo <----- Dimidiation set changed to '..sets.Dimidiation.index[Dimidiation_ind]..' ----->')
	elseif command == 'toggle Req set' then
		Requiescat_ind = Requiescat_ind +1
		if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
	elseif command == 'equip TP set' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'equip Idle set' then
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end