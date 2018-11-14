function get_sets()
--Main Sets	
sets.main ={}
sets.main.index = {'shared', 'pet_tank', 'master'}
ind_main = 1
sets.main.shared =
	{
		head="Tali'ah Turban +1",
		body="Tali'ah Manteel +1",
		hands="Tali'ah Gages +1",
		legs="Tali'ah Sera. +1",
		feet="Tali'ah Crackows +1",
		neck="Empath Necklace",
		waist="Hurch'lan Sash",
		left_ear="Handler's Earring +1",
		right_ear="Brutal Earring",
		left_ring="Thurandaut Ring",
		right_ring="Overbearing Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 0',}},

	}
sets.main.pet_tank =
	{
		head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
		body="Tali'ah Manteel +1",
		hands={ name="Rao Kote", augments={'Pet: HP+100','Pet: Accuracy+15','Pet: Damage taken -3%',}},
		legs="Tali'ah Sera. +1",
		feet={ name="Rao Sune-Ate", augments={'Pet: HP+100','Pet: Accuracy+15','Pet: Damage taken -3%',}},
		neck="Empath Necklace",
		waist="Isa Belt",
		left_ear="Handler's Earring +1",
		right_ear="Handler's Earring",
		left_ring="Thurandaut Ring",
		right_ring="Overbearing Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 0',}},

	}
sets.main.master =
	{
    head="Tali'ah Turban +1",
    body="Tali'ah Manteel +1",
    hands={ name="Herculean Gloves", augments={'Attack+28','"Triple Atk."+4','DEX+10',}},
    legs={ name="Herculean Trousers", augments={'Attack+22','"Triple Atk."+4','AGI+9','Accuracy+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+23','"Triple Atk."+3','AGI+10',}},
    neck="Asperity Necklace",
    waist="Grunfeld Rope",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Apate Ring",
    right_ring="Rajas Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 0',}},

	}

--Idle Sets
sets.idle ={}
sets.idle.index = {'pet_shared', 'pet_tank', 'refresh', 'dt'}
ind_idle = 1
sets.idle.pet_shared = set_combine(sets.main.shared,
	{
	
	})
sets.idle.pet_tank = set_combine(sets.main.pet_tank,
	{
	
	})

sets.idle.refresh=
	{
	
	}

sets.idle.dt=
	{
	
	}
	
--Capacity Gear for Override
sets.capacity ={}
sets.capacity.index = {'off', 'on'}
ind_cap = 2
sets.capacity.off = set_combine(sets.main.ind_main, 
		{
		
		}
		)
sets.capacity.on = set_combine(sets.main.ind_main, 
		{
		back = "Mecisto. Mantle",
		}
		)
		
		
sets.ws_master={
		head="Karagoz Capello +1",
		body={ name="Pitre Tobe", augments={'Enhances "Overdrive" effect',}},
		hands={ name="Rao Kote", augments={'Pet: HP+100','Pet: Accuracy+15','Pet: Damage taken -3%',}},
		legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','Crit. hit damage +4%','AGI+9','Accuracy+8',}},
		feet={ name="Rawhide Boots", augments={'HP+50','Accuracy+15','Evasion+20',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Brutal Earring",
		left_ear="Cessance Earring",
		left_ring="Apate Ring",
		right_ring="Rajas Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 0',}},
}

sets.ws_pet={
		head="Karagoz Capello +1",
		body="Tali'ah Manteel +1",
		hands="Karagoz Guanti",
		legs="Karagoz Pantaloni",
		feet={ name="Naga Kyahan", augments={'Pet: HP+100','Pet: Accuracy+25','Pet: Attack+25',}},
		neck="Empath Necklace",
		waist="Hurch'lan Sash",
		left_ear="Handler's Earring +1",
		right_ear="Brutal Earring",
		left_ring="Thurandaut Ring",
		right_ring="Overbearing Ring",
		back={ name="Dispersal Mantle", augments={'STR+1','DEX+5','Pet: TP Bonus+480',}},
}

sets.ws_pet_overdrive={
		head="Karagoz Capello +1",
		body="Tali'ah Manteel +1",
		hands="Karagoz Guanti",
		legs="Karagoz Pantaloni",
		feet={ name="Naga Kyahan", augments={'Pet: HP+100','Pet: Accuracy+25','Pet: Attack+25',}},
		neck="Empath Necklace",
		waist="Hurch'lan Sash",
		left_ear="Handler's Earring +1",
		right_ear="Brutal Earring",
		left_ring="Thurandaut Ring",
		right_ring="Overbearing Ring",
		back={ name="Dispersal Mantle", augments={'STR+1','DEX+5','Pet: TP Bonus+480',}},
		}

end

function status_change(new, old)
	if new == 'Idle' then
		IdleState()
	elseif new == 'Resting' then
		RestingState()
	elseif new == 'Engaged' then
		EngagedState()
	end
end

function ChangeGear(GearSet)
	equipSet = GearSet
	equip(GearSet)
end

function IdleState()
	ChangeGear(sets.idle[sets.idle.index[ind_idle]])
end

function RestingState()
	ChangeGear(current_set)
end

function EngagedState()
	ChangeGear(sets.main[sets.main.index[ind_main]])
end

function pc_JA(spell, act)

	if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance <= 6 then
		ChangeGear(sets.ws_master)
		-- if spell.english == 'Dragon Kick' then
			-- ChangeGear(sets.ws_master)
		-- end
	end


end

function ac_Global()
    -- if LockGearIndex == true then
        -- ChangeGear(LockGearSet)
        -- msg("Lock Gear is ON -- Swapping Gear")
	if player.status == 'Engaged' then
		EngagedState()
	else
		IdleState()
    end
end



function precast(spell, act)
	if spell.action_type == 'Ability' then 
		pc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		pc_Magic(spell, act)
	else
		pc_Item(spell, act)
	end
end


function pc_JA(spell, act)
end

function pc_Magic(spell, act)
end

function pc_Item(spell, act)
end

function mc_JA(spell, act)
end
function mc_Magic(spell, act)
end
function mc_Item(spell, act)
end


function aftercast(spell, act, spellMap, eventArgs)
	-- if spell.action_type == 'Ability' then
		-- ac_JA(spell)
	-- elseif spell.action_type == 'Magic' then
		-- ac_Magic(spell)
	-- else
		-- ac_Item(spell)
	-- end
	ac_Global()
end

send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind f10 gs c toggle Idle set')

function self_command(command)
	if command == 'toggle TP set' then
		ind_main = ind_main +1
		if ind_main > #sets.main.index then ind_main = 1 end
		send_command('@input /echo <----- TP Set changed to '..sets.main.index[ind_main]..' ----->')
			if player.status == 'Engaged' then
--				current_set = sets.main[sets.main.index[ind_main]]
				equip(sets.main[sets.main.index[ind_main]])
			end
	elseif command == 'toggle Idle set' then
		ind_idle = ind_idle +1
		if ind_idle > #sets.idle.index then ind_idle = 1 end
		send_command('@input /echo <----- Idle Set changed to '..sets.idle.index[ind_idle]..' ----->')
			if player.status == 'Idle' then
				--current_set_idle = sets.idle[sets.idle.index[ind_idle]]
				equip(sets.idle[sets.idle.index[ind_idle]])
			end		
	
	end
end