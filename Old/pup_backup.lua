function get_sets()
	
	sets.main ={}
	sets.main.index ={'tp_shared', 'tank_pet'}
	Main_ind = 1
	sets.main.tp_shared={
		main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
		range="Animator P +1",
		ammo="Automat. Oil +3",
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

	sets.main.tank_pet={
--		main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
		range="Animator P +1",
		ammo="Automat. Oil +3",
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
		main="Gnafron's Adargas",
		range="Animator P +1",
		ammo="Automat. Oil +3",
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
	main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
	range="Animator P +1",
	ammo="Automat. Oil +3",
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
		EngagedState();
	end
end

function ChangeGear(GearSet)
	equipSet = GearSet
	equip(GearSet)
end

function IdleState()
	ChangeGear(sets.main.tank_pet)
end

function RestingState()
	ChangeGear(sets.ws_master)
end

function EngagedState()
	ChangeGear(sets.main.tp_shared)
end

function pc_JA(spell, act)

	if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance <= 6 then
		if spell.english == 'Dragon Kick' then
			ChangeGear(sets.ws_master)
		end
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



-- function pc_JA(spell, act)
	-- if spell.type == 'WeaponSkill' then
			-- ChangeGear(sets.ws_master)
-- end