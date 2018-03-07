local SpecializationInfo =
{
	Name = "SpecializationInfo",
	Type = "System",
	Namespace = "C_SpecializationInfo",

	Functions =
	{
		{
			Name = "GetAllSelectedPvpTalentIDs",
			Type = "Function",

			Returns =
			{
				{ Name = "selectedPvpTalentIDs", Type = "table", InnerType = "number", Nilable = false },
			},
		},
		{
			Name = "GetInspectSelectedPvpTalent",
			Type = "Function",

			Arguments =
			{
				{ Name = "inspectedUnit", Type = "string", Nilable = false },
				{ Name = "talentIndex", Type = "number", Nilable = false },
			},

			Returns =
			{
				{ Name = "selectedTalentID", Type = "number", Nilable = true },
			},
		},
		{
			Name = "GetPvpTalentAlertStatus",
			Type = "Function",

			Returns =
			{
				{ Name = "hasUnspentSlot", Type = "bool", Nilable = false },
				{ Name = "hasNewTalent", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "GetPvpTalentSlotInfo",
			Type = "Function",

			Arguments =
			{
				{ Name = "talentIndex", Type = "number", Nilable = false },
			},

			Returns =
			{
				{ Name = "slotInfo", Type = "PvpTalentSlotInfo", Nilable = true },
			},
		},
		{
			Name = "GetPvpTalentSlotUnlockLevel",
			Type = "Function",

			Arguments =
			{
				{ Name = "talentIndex", Type = "number", Nilable = false },
			},

			Returns =
			{
				{ Name = "requiredLevel", Type = "number", Nilable = true },
			},
		},
		{
			Name = "GetPvpTalentUnlockLevel",
			Type = "Function",

			Arguments =
			{
				{ Name = "talentID", Type = "number", Nilable = false },
			},

			Returns =
			{
				{ Name = "requiredLevel", Type = "number", Nilable = true },
			},
		},
		{
			Name = "IsPvpTalentLocked",
			Type = "Function",

			Arguments =
			{
				{ Name = "talentID", Type = "number", Nilable = false },
			},

			Returns =
			{
				{ Name = "locked", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "SetPvpTalentLocked",
			Type = "Function",

			Arguments =
			{
				{ Name = "talentID", Type = "number", Nilable = false },
				{ Name = "locked", Type = "bool", Nilable = false },
			},
		},
	},

	Events =
	{
		{
			Name = "ActiveTalentGroupChanged",
			Type = "Event",
			LiteralName = "ACTIVE_TALENT_GROUP_CHANGED",
			Payload =
			{
				{ Name = "curr", Type = "number", Nilable = false },
				{ Name = "prev", Type = "number", Nilable = false },
			},
		},
		{
			Name = "ConfirmTalentWipe",
			Type = "Event",
			LiteralName = "CONFIRM_TALENT_WIPE",
			Payload =
			{
				{ Name = "cost", Type = "number", Nilable = false },
				{ Name = "respecType", Type = "number", Nilable = false },
			},
		},
		{
			Name = "PetSpecializationChanged",
			Type = "Event",
			LiteralName = "PET_SPECIALIZATION_CHANGED",
		},
		{
			Name = "PlayerLearnPvpTalentFailed",
			Type = "Event",
			LiteralName = "PLAYER_LEARN_PVP_TALENT_FAILED",
		},
		{
			Name = "PlayerLearnTalentFailed",
			Type = "Event",
			LiteralName = "PLAYER_LEARN_TALENT_FAILED",
		},
		{
			Name = "PlayerPvpTalentUpdate",
			Type = "Event",
			LiteralName = "PLAYER_PVP_TALENT_UPDATE",
		},
		{
			Name = "PlayerTalentUpdate",
			Type = "Event",
			LiteralName = "PLAYER_TALENT_UPDATE",
		},
		{
			Name = "SpecInvoluntarilyChanged",
			Type = "Event",
			LiteralName = "SPEC_INVOLUNTARILY_CHANGED",
			Payload =
			{
				{ Name = "isPet", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "TalentsInvoluntarilyReset",
			Type = "Event",
			LiteralName = "TALENTS_INVOLUNTARILY_RESET",
			Payload =
			{
				{ Name = "isPetTalents", Type = "bool", Nilable = false },
			},
		},
	},

	Tables =
	{
		{
			Name = "PvpTalentSlotInfo",
			Type = "Structure",
			Fields =
			{
				{ Name = "enabled", Type = "bool", Nilable = false },
				{ Name = "selectedTalentID", Type = "number", Nilable = true },
				{ Name = "availableTalentIDs", Type = "table", InnerType = "number", Nilable = false },
			},
		},
	},
};

APIDocumentation:AddDocumentationTable(SpecializationInfo);