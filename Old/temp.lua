
sets.main ={}
sets.main.ind_main = {'shared', 'pet_tank', 'master'}
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


sets.capacity ={}
sets.capacity.ind_cap = {'off', 'on'}
ind_cap = 1
sets.capacity.off = set_combine(sets.main.ind_main, 
		{
		
		}
		)
sets.capacity.on = set_combine(sets.main.ind_main, 
		{
		back = "Mecisto. Mantle",
		}
		)