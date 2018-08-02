#pragma once

#include <stdint.h>
#include <string>
#include <vector>
#include <list>

class CSteamAPIContext;
class IAddonDownloadNotification;
struct SteamUGCDetails_t;

namespace IAddonSystem
{
	struct Information
	{
		std::string title;
		std::string file;
		std::string placeholder1;
		uint64_t wsid;
		uint64_t creator;
		uint64_t placeholder2;
		uint64_t placeholder3;
		uint64_t placeholder4;
		uint64_t placeholder5;
		uint64_t placeholder6;
		uint64_t placeholder7;
		uint16_t placeholder8;
		bool placeholder9;
	};

	struct UGCInfo
	{
		std::string title;
		std::string file;
		std::string placeholder1;
		uint64_t wsid;
		uint64_t creator;
		uint32_t pubdate;
	};
}

namespace Addon
{
	namespace Job
	{
		class Base;
	}

	class FileSystem
	{
		public:
			virtual void Clear( ) = 0;
			virtual void Refresh( ) = 0;
			virtual int MountFile( const std::string &, std::vector<std::string> * ) = 0;
			virtual bool ShouldMount( const std::string & ) = 0;
			virtual bool ShouldMount( uint64_t ) = 0;
			virtual void SetShouldMount( const std::string &, bool ) = 0;
			virtual void Save( ) = 0;
			virtual const std::list<IAddonSystem::Information> &GetList( ) const = 0;
			virtual const std::list<IAddonSystem::UGCInfo> &GetUGCList( ) const = 0;
			virtual void ScanForSubscriptions( CSteamAPIContext *, const char * ) = 0;
			virtual void Think( ) = 0;
			virtual void SetDownloadNotify( IAddonDownloadNotification * ) = 0;
			virtual bool IsSubscribed( uint64_t ) = 0;
			virtual const IAddonSystem::Information *FindFileOwner( const std::string & ) = 0;
			virtual void AddFile( const IAddonSystem::Information & ) = 0;
			virtual void ClearAllGMAs( ) = 0;
			virtual void MountFloatingAddons( ) = 0;
			virtual void Shutdown( ) = 0;
			virtual void AddFile( const SteamUGCDetails_t & ) = 0;
			virtual void AddSubscription( const SteamUGCDetails_t & ) = 0;
			virtual void AddJob( Job::Base * ) = 0;
			virtual void Notify( ) = 0;
			virtual bool HasChanges( ) = 0;
			virtual void MarkChanged( ) = 0;
			virtual void AddonDownloaded( IAddonSystem::Information & ) = 0;
			virtual const std::list<SteamUGCDetails_t> &GetSubList( ) const = 0;
			virtual void Load( ) = 0;
	};

}