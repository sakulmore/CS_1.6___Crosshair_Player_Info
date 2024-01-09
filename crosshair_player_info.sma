#include <amxmodx>
#include <amxmisc>

new g_iSyncHud

public plugin_init()
{
    register_plugin( "Show Player Status", "1.0", "sakulmore" )

    g_iSyncHud = CreateHudSyncObj();

    register_event( "StatusValue", "show_info", "be", "1=2", "2!0" )
    register_event( "StatusValue", "hide_info", "be", "1=1", "2=0" )
}
public show_info( id )
{
    if( is_user_connected( id ) )
    {
        new player = read_data( 2 )
        new name[ 32 ]
        get_user_name( player, name, charsmax( name ) )
        if( is_user_alive( player ) )
        {
            set_hudmessage( 25, 200, 11, -1.0, 0.53, 0, 1.0, 2.1, 0.0, 0.0, -1 )
            ShowSyncHudMsg( id, g_iSyncHud, "%s^nHealth: %d%% | Armor: %d%%", name, get_user_health( player ), get_user_armor( player ) )
        }
    }
}
public hide_info( id )
{
    if( is_user_connected( id ) )
        ClearSyncHud( id, g_iSyncHud )
}
