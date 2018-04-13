Voice_PartyChannelTypeToChatInfoType =
{
	[Enum.ChatChannelType.Private_Party] = "PARTY",
	[Enum.ChatChannelType.Public_Party] = "INSTANCE_CHAT",
};

Voice_RaidChannelTypeToChatInfoType =
{
	[Enum.ChatChannelType.Private_Party] = "RAID",
	[Enum.ChatChannelType.Public_Party] = "INSTANCE_CHAT",
};

function Voice_GetChatInfoForChannelType(channel)
	local isRaid = IsChatChannelRaid(channel.channelType);
	local chatType = isRaid and Voice_RaidChannelTypeToChatInfoType[channel.channelType] or Voice_PartyChannelTypeToChatInfoType[channel.channelType];
	if chatType then
		return ChatTypeInfo[chatType];
	end
end

function Voice_GetVoiceChannelNotificationColor(channelID)
	local channel = C_VoiceChat.GetChannel(channelID);
	if channel then
		local chatInfo = Voice_GetChatInfoForChannelType(channel);
		if chatInfo then
			return Chat_GetChannelColor(chatInfo);
		end
	end

	-- Default fallback for voice chat notifications
	return NORMAL_FONT_COLOR:GetRGB();
end

local SUPPRESS_ERROR_MESSAGE = true;
local voiceChatStatusToGameError =
{
	[Enum.VoiceChatStatusCode.Success] = SUPPRESS_ERROR_MESSAGE,
	[Enum.VoiceChatStatusCode.OperationPending] = SUPPRESS_ERROR_MESSAGE,
	[Enum.VoiceChatStatusCode.ClientAlreadyLoggedIn] = SUPPRESS_ERROR_MESSAGE,
	[Enum.VoiceChatStatusCode.AlreadyInChannel] = SUPPRESS_ERROR_MESSAGE,
	[Enum.VoiceChatStatusCode.TooManyRequests] = LE_GAME_ERR_VOICE_CHAT_TOO_MANY_REQUESTS,
	[Enum.VoiceChatStatusCode.ChannelNameTooShort] = LE_GAME_ERR_VOICE_CHAT_CHANNEL_NAME_TOO_SHORT,
	[Enum.VoiceChatStatusCode.ChannelNameTooLong] = LE_GAME_ERR_VOICE_CHAT_CHANNEL_NAME_TOO_LONG,
	[Enum.VoiceChatStatusCode.ChannelAlreadyExists] = LE_GAME_ERR_VOICE_CHAT_CHANNEL_ALREADY_EXISTS,
	[Enum.VoiceChatStatusCode.TargetNotFound] = LE_GAME_ERR_VOICE_CHAT_TARGET_NOT_FOUND,
	[Enum.VoiceChatStatusCode.ProxyConnectionTimeOut] = LE_GAME_ERR_VOICE_CHAT_SERVICE_LOST,
	[Enum.VoiceChatStatusCode.ProxyConnectionUnexpectedDisconnect] = LE_GAME_ERR_VOICE_CHAT_SERVICE_LOST,
};

function Voice_GetGameErrorFromStatusCode(statusCode)
	local gameError = voiceChatStatusToGameError[statusCode];
	if gameError == SUPPRESS_ERROR_MESSAGE then
		return nil;
	end

	return gameError or LE_GAME_ERR_VOICE_CHAT_GENERIC_UNABLE_TO_CONNECT;
end

function Voice_GetGameErrorStringFromStatusCode(statusCode)
	local gameError = Voice_GetGameErrorFromStatusCode(statusCode);
	if gameError then
		local stringId = GetGameMessageInfo(gameError);
		if stringId then
			return _G[stringId];
		end
	end
end