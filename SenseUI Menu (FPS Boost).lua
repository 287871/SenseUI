-- Check if SenseUI was loaded.--- SenseUI Menu by uglych discord is Uglych#1515
if SenseUI == nil then
	----RunScript( "senseui.lua" );
	end
	
	configs = {}
	
	local selected = 1
	local scroll = 0
	
	local configname = ""

	
	local load_pressed = false
	local save_pressed = false
	local add_pressed = false
	local remove_pressed = false
	
	local old_load_pressed, old_save_pressed, old_add_pressed, old_remove_pressed
	
	local pselect = 1;
	local aa_choose = 1;
	local weapon_select = 1;
	
	local weapon_select2 = 1;
	--local mpt = gui.GetValue("misc.fakelag.factor");
	-------------- for normal work
	local window_moveable = true;
	local bind_button = SenseUI.Keys.home;
	local bind_active = false;
	local bind_detect = SenseUI.KeyDetection.on_hotkey;
	local show_gradient = true;
	local window_bkey = SenseUI.Keys.delete;
	local window_bact = false;
	local window_bdet = SenseUI.KeyDetection.on_hotkey;
	
	local enemy_flags   = {
		["持有C4"] = gui.GetValue("esp.overlay.enemy.hasc4"),
		["有拆弹器"] = gui.GetValue("esp.overlay.enemy.hasdefuser"),
		["正在拆弹"] = gui.GetValue("esp.overlay.enemy.defusing"),
		["正在安装C4"] = gui.GetValue("esp.overlay.enemy.planting"),
		["已经致盲"] = gui.GetValue("esp.overlay.enemy.flashed"),
		["正在开镜"] = gui.GetValue("esp.overlay.enemy.scoped"),
		["正在装弹"] = gui.GetValue("esp.overlay.enemy.reloading"),
	
	}
	local team_flags   = {
		["持有C4"] = gui.GetValue("esp.overlay.friendly.hasc4"),
		["有拆弹器"] = gui.GetValue("esp.overlay.friendly.hasdefuser"),
		["正在拆弹"] = gui.GetValue("esp.overlay.friendly.defusing"),
		["正在安装C4"] = gui.GetValue("esp.overlay.friendly.planting"),
		["已经致盲"] = gui.GetValue("esp.overlay.friendly.flashed"),
		["正在开镜"] = gui.GetValue("esp.overlay.friendly.scoped"),
		["正在装弹"] = gui.GetValue("esp.overlay.friendly.reloading"),
	
	}
	SenseUI.EnableLogs = false;



	
	
	function draw_callback()
		if SenseUI.BeginWindow( "wnd1", 50, 50, 1000, 750) then
			SenseUI.DrawTabBar();
	
			if show_gradient then
				SenseUI.AddGradient();
			end
			SenseUI.SetWindowDrawTexture( false ); 
			SenseUI.SetWindowMoveable( window_moveable );
			SenseUI.SetWindowOpenKey( window_bkey );
			
	
			if SenseUI.BeginTab( "aimbot", SenseUI.Icons.rage ) then
				if SenseUI.BeginGroup( "mainaim", "Aimbot", 15, 25, 420, 700 ) then
					local switch_enabled = gui.GetValue("rbot.master");
					switch_enabled = SenseUI.Checkbox( "Enable", switch_enabled );
					if switch_enabled then
						gui.SetValue("rbot.master", 1);
						gui.SetValue("rbot.master", 1);
						else
						gui.SetValue("rbot.master", 0);
						gui.SetValue("rbot.master", 0);
					end
					local prefersafe = gui.GetValue("rbot.hitscan.mode.shared.prefersafe");
					prefersafe = SenseUI.Checkbox( "Prefer safe point", prefersafe );
					if prefersafe then
						gui.SetValue( "rbot.hitscan.mode.shared.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.asniper.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.hpistol.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.lmg.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.pistol.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.shotgun.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.smg.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.scout.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.sniper.prefersafe", 1)
						gui.SetValue( "rbot.hitscan.mode.rifle.prefersafe", 1);
						else
						gui.SetValue( "rbot.hitscan.mode.shared.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.asniper.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.hpistol.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.lmg.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.pistol.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.shotgun.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.smg.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.scout.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.sniper.prefersafe", 0)
						gui.SetValue( "rbot.hitscan.mode.rifle.prefersafe", 0)
					end
					SenseUI.Label("Force dafe point ");
				--	local ForcesafeKey = gui.GetValue("rbot.hitscan.mode.ForcesafeKeyKeybind");
				--	ForcesafeKey = SenseUI.Bind("Force dafe point ", true, ForcesafeKey);
				--	gui.SetValue("rbot.hitscan.mode.ForcesafeKeyKeybind", ForcesafeKey);
					
			

					local ToggleEnable= gui.GetValue("rbot.aim.enable");
					ToggleEnable = SenseUI.Checkbox("Automatic fire", ToggleEnable);
				   gui.SetValue("rbot.aim.enable", ToggleEnable);


				
					--  local ToggleEnableKeybind = gui.GetValue("rbot.aim.ToggleEnableKeybind");
					 -- ToggleEnableKeybind = SenseUI.Bind("Automatic fire", true, ToggleEnableKeybind);
					--gui.SetValue("rbot.aim.ToggleEnableKeybind", ToggleEnableKeybind);



					local Auto_wallall = gui.GetValue("rbot.hitscan.mode.shared.autowall");
					Auto_wallall = SenseUI.Checkbox( "Automatic penetration", Auto_wallall );
					if Auto_wallall then
						gui.SetValue( "rbot.hitscan.mode.shared.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.asniper.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.hpistol.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.lmg.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.pistol.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.shotgun.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.smg.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.scout.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.sniper.autowall", 1)
						gui.SetValue( "rbot.hitscan.mode.rifle.autowall", 1);
						else
						gui.SetValue( "rbot.hitscan.mode.shared.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.asniper.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.hpistol.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.lmg.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.pistol.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.shotgun.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.smg.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.scout.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.sniper.autowall", 0)
						gui.SetValue( "rbot.hitscan.mode.rifle.autowall", 0)
					end
					local silentaim = gui.GetValue("rbot.aim.target.silentaim");
					silentaim = SenseUI.Checkbox("Silent aim", silentaim);
					gui.SetValue("rbot.aim.target.silentaim", silentaim);

					local Minimum_chance = gui.GetValue("rbot.accuracy.weapon.shared.hitchance");
					Minimum_chance = SenseUI.Slider("Minimum hit chance", 0, 100, "%", "0%", "100%", false, Minimum_chance);
					if Minimum_chance then
						gui.SetValue( "rbot.accuracy.weapon.shared.hitchance", Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.asniper.hitchance", Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.hpistol.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.lmg.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.pistol.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.shotgun.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.smg.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.scout.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.sniper.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.rifle.hitchance",Minimum_chance);
						else
						gui.SetValue( "rbot.accuracy.weapon.shared.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.asniper.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.hpistol.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.lmg.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.pistol.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.shotgun.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.smg.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.scout.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.sniper.hitchance",Minimum_chance)
						gui.SetValue( "rbot.accuracy.weapon.rifle.hitchance",Minimum_chance)
					end
					local Minimum_damage = gui.GetValue("rbot.accuracy.weapon.shared.mindmg");
					Minimum_damage = SenseUI.Slider("Minimum damage", 0, 130, "", "0", "130", false, Minimum_damage);
					if Minimum_chance then
						gui.SetValue( "rbot.accuracy.weapon.shared.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.asniper.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.hpistol.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.lmg.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.pistol.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.shotgun.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.smg.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.scout.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.sniper.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.rifle.mindmg",Minimum_damage);
						else
						gui.SetValue( "rbot.accuracy.weapon.shared.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.asniper.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.hpistol.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.lmg.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.pistol.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.shotgun.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.smg.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.scout.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.sniper.mindmg",Minimum_damage)
						gui.SetValue( "rbot.accuracy.weapon.rifle.mindmg",Minimum_damage)
					end

					local autoscope = (gui.GetValue("rbot.aim.automation.scope") + 1);
					SenseUI.Label("Automatic scope");
					autoscope = SenseUI.Combo("autoscope", { "-", "On-Automatic Unzoom", "On-No Unzoom" }, autoscope);
					gui.SetValue("rbot.aim.automation.scope", autoscope-1);

					local fov_rr = gui.GetValue("rbot.aim.target.fov");		
					fov_rr = SenseUI.Slider("FOV", 0, 180, "°", "0°", "180°", false, fov_rr);
					gui.SetValue("rbot.aim.target.fov", fov_rr);

					local quickstop = gui.GetValue("rbot.accuracy.movement.quickstop");
					quickstop = SenseUI.Checkbox("Quick shop", quickstop);
					gui.SetValue("rbot.accuracy.movement.quickstop", quickstop);


					local aimlock = gui.GetValue("rbot.aim.target.lock");
					aimlock = SenseUI.Checkbox("Aim lock", aimlock);
					gui.SetValue("rbot.aim.target.lock", aimlock);

				--	local slowkey = gui.GetValue("rbot.hitscan.mode.AutoWallKeyKeybind");
				--	slowkey = SenseUI.Bind("AutoWallkey", true, slowkey);
				--	gui.SetValue("rbot.hitscan.mode.AutoWallKeyKeybind", slowkey);

					
			

					local s_limit = (gui.GetValue("misc.autojump") + 1);
	
					
	
	
					

			--		local ColorPicker = gui.GetValue("esp.overlay.enemy.box.clr");
			--		ColorPicker = SenseUI.ColorPicker("FOV", 0, 180, "°", "0°", "180°", false, ColorPicker);
		--			gui.SetValue("esp.overlay.enemy.box.clr", ColorPicker);
					
					
	
					local ff_rage = gui.GetValue("rbot.accuracy.posadj.backtrack");
					ff_rage = SenseUI.Checkbox("Backtrack ing", ff_rage);
					gui.SetValue("rbot.accuracy.posadj.backtrack", ff_rage);
	
					local resolver = gui.GetValue("rbot.accuracy.posadj.resolver");
					local override_resolver = gui.GetValue("rbot.accuracy.posadj.resolver");
					resolver = SenseUI.Checkbox("Resolver", resolver);
					gui.SetValue("rbot.accuracy.posadj.resolver", resolver);
	
					local fov_rr = gui.GetValue("rbot.hitscan.maxprocessingtime");				
					fov_rr = SenseUI.Slider("Max processing time", 5, 75, "", "5%", "75%", false, fov_rr);
					gui.SetValue("rbot.hitscan.maxprocessingtime", fov_rr);
	
					local autostop7 = gui.GetValue("rbot.hitscan.precisehitscan");
					autostop7 = SenseUI.Checkbox("Precise hitscan", autostop7);
					gui.SetValue("rbot.hitscan.precisehitscan", autostop7);
	
					local autostop8 = gui.GetValue("rbot.hitscan.predictive");
					autostop8 = SenseUI.Checkbox("Predictive", autostop8);
					gui.SetValue("rbot.hitscan.predictive", autostop8);

					local autorevolver = gui.GetValue("rbot.aim.automation.revolver");
					local autoawpbody = gui.GetValue("rbot.hitscan.points.sniper.scale");
					local autopistol = gui.GetValue("rbot.aim.automation.pistol");
				   
				
   
					
	   
					autorevolver = SenseUI.Checkbox("Automatic revolver", autorevolver);
					  gui.SetValue("rbot.aim.automation.revolver", autorevolver);

					  autopistol = SenseUI.Checkbox("Automatic Pisctol", autopistol);
					  gui.SetValue("rbot.aim.automation.pistol", autopistol);

					  
					 
					
					
					
					  
	
					
					SenseUI.EndGroup();
				end
				if SenseUI.BeginGroup( "otheraims", "Other", 460, 25, 420, 700 ) then
					local antirecoil = gui.GetValue("rbot.accuracy.weapon.shared.antirecoil");
					  antirecoil = SenseUI.Checkbox( "Automatic recoil", antirecoil );
					  if antirecoil then
						gui.SetValue( "rbot.accuracy.weapon.shared.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.asniper.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.hpistol.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.lmg.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.pistol.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.shotgun.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.smg.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.scout.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.sniper.antirecoil", 1)
						gui.SetValue( "rbot.accuracy.weapon.rifle.antirecoil", 1);
						else
							gui.SetValue( "rbot.accuracy.weapon.shared.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.asniper.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.hpistol.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.lmg.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.pistol.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.shotgun.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.smg.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.scout.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.sniper.antirecoil", 0)
							gui.SetValue( "rbot.accuracy.weapon.rifle.antirecoil", 0)
					end

					local autostop = gui.GetValue("rbot.accuracy.wpnmovement.shared.autostop");
					autostop = SenseUI.Checkbox( "Quick stop", autostop );
					if autostop then
						gui.SetValue( "rbot.accuracy.wpnmovement.shared.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.asniper.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.hpistol.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.lmg.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.pistol.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.shotgun.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.smg.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.scout.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.sniper.autostop", 1)
						gui.SetValue( "rbot.accuracy.wpnmovement.rifle.autostop", 1);
						else
						gui.SetValue( "rbot.accuracy.wpnmovement.shared.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.asniper.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.hpistol.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.lmg.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.pistol.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.shotgun.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.smg.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.scout.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.sniper.autostop", 0)
						gui.SetValue( "rbot.accuracy.wpnmovement.rifle.autostop", 0)
					end

					



					local autostopopts   = {
						["Between Shots"] = gui.GetValue("rbot.accuracy.wpnmovement.shared.autostopopts.betweenshots"),
						["Early"] = gui.GetValue("rbot.accuracy.wpnmovement.shared.autostopopts.early"),
						["Slow Walk"] = gui.GetValue("rbot.accuracy.wpnmovement.shared.autostopopts.slowwalk"),
						["Duck"] = gui.GetValue("rbot.accuracy.wpnmovement.shared.autostopopts.duck"),
						["Inmolotov"] = gui.GetValue("rbot.accuracy.wpnmovement.shared.autostopopts.inmolotov"),			
					}
					autostopopts = SenseUI.MultiCombo("Quick stop options", { "Between Shots", "Early", "Slow Walk", "Duck","Inmolotov" }, team_flags);
						gui.SetValue("rbot.accuracy.wpnmovement.shared.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shared.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shared.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shared.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shared.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--
						gui.SetValue("rbot.accuracy.wpnmovement.zeus.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.zeus.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.zeus.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.zeus.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.zeus.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--
						gui.SetValue("rbot.accuracy.wpnmovement.pistol.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.pistol.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.pistol.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.pistol.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.pistol.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--
						gui.SetValue("rbot.accuracy.wpnmovement.hpistol.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.hpistol.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.hpistol.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.hpistol.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.hpistol.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--smg
						gui.SetValue("rbot.accuracy.wpnmovement.smg.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.smg.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.smg.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.smg.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.smg.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--rbot.accuracy.wpnmovement.rifle.autostopopts
						gui.SetValue("rbot.accuracy.wpnmovement.rifle.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.rifle.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.rifle.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.rifle.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.rifle.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--rbot.accuracy.wpnmovement.shotgun.autostop
						gui.SetValue("rbot.accuracy.wpnmovement.shotgun.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shotgun.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shotgun.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shotgun.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.shotgun.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--rbot.accuracy.wpnmovement.scout.autostopopts
						gui.SetValue("rbot.accuracy.wpnmovement.scout.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.scout.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.scout.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.scout.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.scout.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--rbot.accuracy.wpnmovement.asniper.autostopopts
						gui.SetValue("rbot.accuracy.wpnmovement.asniper.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.asniper.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.asniper.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.asniper.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.asniper.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--rbot.accuracy.wpnmovement.sniper.autostopopts
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.sniper.autostopopts.inmolotov", autostopopts["Inmolotov"]);
						--rbot.accuracy.wpnmovement.lmg.autostopopts
						gui.SetValue("rbot.accuracy.wpnmovement.lmg.autostopopts.betweenshots", autostopopts["Between Shots"]);
						gui.SetValue("rbot.accuracy.wpnmovement.lmg.autostopopts.early", autostopopts["Early"]);
						gui.SetValue("rbot.accuracy.wpnmovement.lmg.autostopopts.slowwalk", autostopopts["Slow Walk"]);
						gui.SetValue("rbot.accuracy.wpnmovement.lmg.autostopopts.duck", autostopopts["Duck"]);
						gui.SetValue("rbot.accuracy.wpnmovement.lmg.autostopopts.inmolotov", autostopopts["Inmolotov"]);

						local bodyaim_force = gui.GetValue("rbot.hitscan.mode.shared.bodyaim.force");
						bodyaim_force = SenseUI.Checkbox( "Prefer body aim", bodyaim_force );
					if bodyaim_force then
						gui.SetValue( "rbot.hitscan.mode.shared.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.asniper.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.hpistol.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.lmg.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.pistol.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.shotgun.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.smg.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.scout.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.sniper.bodyaim.force", 1)
						gui.SetValue( "rbot.hitscan.mode.rifle.bodyaim.force", 1);
						else
							gui.SetValue( "rbot.hitscan.mode.shared.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.asniper.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.hpistol.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.lmg.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.pistol.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.shotgun.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.smg.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.scout.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.sniper.bodyaim.force", 0)
							gui.SetValue( "rbot.hitscan.mode.rifle.bodyaim.force", 0)
					end

					SenseUI.Label("Duck peek assist");
					local fakecrouchkey = gui.GetValue("rbot.antiaim.extra.fakecrouchkey");
					fakecrouchkey = SenseUI.Bind("Fake duck", true, fakecrouchkey);
					gui.SetValue("rbot.antiaim.extra.fakecrouchkey", fakecrouchkey);

					

	

					SenseUI.Label("Double tap", true);
					local doublefire = (gui.GetValue("rbot.accuracy.weapon.shared.doublefire") + 1);  
					doublefire = SenseUI.Combo("doublefire", { "Off", "Shift", "Rapid" }, doublefire);
					gui.SetValue("rbot.accuracy.weapon.shared.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.pistol.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.hpistol.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.smg.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.rifle.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.shotgun.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.asniper.doublefire", doublefire-1);
					gui.SetValue("rbot.accuracy.weapon.lmg.doublefire", doublefire-1);

					if doublefire  > 1 then
					local doublefire_hc = gui.GetValue("rbot.accuracy.weapon.shared.doublefirehc");
					doublefire_hc = SenseUI.Slider("Double fire Hit chance", 0, 100, "%", "0%", "100%", false, doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.shared.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.pistol.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.hpistol.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.smg.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.rifle.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.shotgun.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.asniper.doublefirehc", doublefire_hc);
					gui.SetValue("rbot.accuracy.weapon.lmg.doublefirehc", doublefire_hc);
					end
					
				   SenseUI.EndGroup();
			   end
		  
				
			
				
			end
			SenseUI.EndTab();
			if SenseUI.BeginTab( "antiaim", SenseUI.Icons.antiaim ) then
				if SenseUI.BeginGroup( "antiaim main", "Fake lag", 460, 25, 420, 400 ) then

					local fakelag_enable = gui.GetValue("misc.fakelag.enable");
					fakelag_enable = SenseUI.Checkbox("Enable", fakelag_enable);
					gui.SetValue("misc.fakelag.enable", fakelag_enable);

					local fakelag_key = gui.GetValue("misc.fakelag.key");
					fakelag_key = SenseUI.Bind("slow", true, fakelag_key);
					gui.SetValue("misc.fakelag.key", fakelag_key);

					local fakelag_condition   = {
						["Inair"] = gui.GetValue("misc.fakelag.condition.inair"),
						["Moving"] = gui.GetValue("misc.fakelag.condition.moving"),
						["Peek"] = gui.GetValue("misc.fakelag.condition.peek"),
						["Standing"] = gui.GetValue("misc.fakelag.condition.standing"),			
					}
						fakelag_condition = SenseUI.MultiCombo("Customize triggers", { "While ln air", "While moving", "Peek", "While standing" }, team_flags);
						gui.SetValue("misc.fakelag.condition.inair", fakelag_condition["While ln air"]);
						gui.SetValue("misc.fakelag.condition.moving", fakelag_condition["While moving"]);
						gui.SetValue("misc.fakelag.condition.peek", fakelag_condition["Peek"]);
						gui.SetValue("misc.fakelag.condition.standing", fakelag_condition["While standing"]);

						local fakelag_type = (gui.GetValue("misc.fakelag.type") + 1);
						SenseUI.Label("Amount");
						fakelag_type = SenseUI.Combo("fakelagtype", { "Normal", "Adaptve", "Random", "Switch" }, fakelag_type);
						gui.SetValue("misc.fakelag.type", fakelag_type-1);
		
					SenseUI.EndGroup();
				end
				

				if SenseUI.BeginGroup( "anti-aim", "Anti-aimbot angles", 15, 25, 420, 700 ) then

					SenseUI.Label("Pitch");
					local adirection2 = (gui.GetValue("rbot.antiaim.advanced.pitch") + 1); 
					adirection2 = SenseUI.Combo(adirection2_rage, { "Off", "Down", "Down(Untrusted)" }, adirection2);
					gui.SetValue("rbot.antiaim.advanced.pitch", adirection2-1);
	
					local aa20= gui.GetValue("rbot.antiaim.advanced.autodir.edges");
					aa20 = SenseUI.Checkbox("Auto direction at edges", aa20);
				   gui.SetValue("rbot.antiaim.advanced.autodir.edges", aa20);
	
				
				   	local aa21= gui.GetValue("rbot.antiaim.advanced.autodir.targets");
					aa21 = SenseUI.Checkbox("Auto direction at targets", aa21);
					gui.SetValue("rbot.antiaim.advanced.autodir.targets", aa21);

					

							   	
				   
					SenseUI.Label("Direction");
				   aa_choose = SenseUI.Combo( "", { "Bsae", "Left", "Right" }, aa_choose);
					if aa_choose == 1 then
					   
			
						local custom_yaw = gui.GetValue("rbot.antiaim.base.rotation");
						custom_yaw = SenseUI.Slider( "Rotation", -58, 58, "°", "-58°", "58°", false, custom_yaw);
						gui.SetValue("rbot.antiaim.base.rotation", custom_yaw);
	
						local stand_velocity = gui.GetValue("rbot.antiaim.base.lby");
						stand_velocity = SenseUI.Slider( "LBY", -180, 180, "", "-180", "180", false, stand_velocity);
						gui.SetValue("rbot.antiaim.base.lby", stand_velocity);
				   else if aa_choose == 2 then
	
					   local custom_pitch_move = gui.GetValue("rbot.antiaim.left.rotation");
						custom_pitch_move = SenseUI.Slider( "Rotation", -58, 58, "°", "-58°", "58°", false, custom_pitch_move);
						gui.SetValue("rbot.antiaim.left.rotation", custom_pitch_move);
	
						local custom_yaw_move = gui.GetValue("rbot.antiaim.left.lby");
					  custom_yaw_move = SenseUI.Slider( "LBY", -180, 180, "°", "-180°", "180°", false, custom_yaw_move);
						gui.SetValue("rbot.antiaim.left.lby", custom_yaw_move);
	
				   else if aa_choose == 3 then
	
					local custom_pitch_move2 = gui.GetValue("rbot.antiaim.right.rotation");
						custom_pitch_move2 = SenseUI.Slider( "Rotation", -58, 58, "°", "-58°", "58°", false, custom_pitch_move2);
						gui.SetValue("rbot.antiaim.right.rotation", custom_pitch_move2);
	
					local custom_yaw_move2 = gui.GetValue("rbot.antiaim.right.lby");
					  	custom_yaw_move2 = SenseUI.Slider( "LBY", -180, 180, "°", "-180°", "180°", false, custom_yaw_move2);
						gui.SetValue("rbot.antiaim.right.lby", custom_yaw_move2);
	
		  
					end
					end
					end
					
					SenseUI.Label("Other");
					local adirection3 = (gui.GetValue("rbot.antiaim.advanced.antialign") + 1); 
					adirection3 = SenseUI.Combo(adirection3_rage, { "Lowerbody", "Micromovement" }, adirection3);
					gui.SetValue("rbot.antiaim.advanced.antialign", adirection3-1);
	
				local autostop17= gui.GetValue("rbot.antiaim.condition.use");
				autostop17 = SenseUI.Checkbox("Disable on use", autostop17);
			   gui.SetValue("rbot.antiaim.condition.use", autostop17);
	
			   local autostop18= gui.GetValue("rbot.antiaim.condition.knife");
					autostop18 = SenseUI.Checkbox("Disable on knife", autostop18);
				   gui.SetValue("rbot.antiaim.condition.knife", autostop18);
	
				   local autostop19= gui.GetValue("rbot.antiaim.condition.shiftonshot");
					autostop19 = SenseUI.Checkbox("Disable on grenade", autostop19);
				   gui.SetValue("rbot.antiaim.condition.shiftonshot", autostop19);
	
		
				
	
				   local autostop20= gui.GetValue("rbot.antiaim.extra.staticlegs");
					autostop20 = SenseUI.Checkbox("Static legs", autostop20);
				   gui.SetValue("rbot.antiaim.extra.staticlegs", autostop20);
	
				   local autostop21= gui.GetValue("rbot.antiaim.advanced.antiresolver");
					autostop21 = SenseUI.Checkbox("Anti-resolver", autostop21);
				   gui.SetValue("rbot.antiaim.advanced.antiresolver", autostop21);

				   
	
	
				   SenseUI.Label("Fake duck style");
					local adirection = (gui.GetValue("rbot.antiaim.extra.fakecrouchstyle") + 1); 
					adirection = SenseUI.Combo(adirection_rage, { "Duck", "Un Duck" }, adirection);
					gui.SetValue("rbot.antiaim.extra.fakecrouchstyle", adirection-1);
					

					
	
					SenseUI.Label("Faky expose type");
					local exposetype = (gui.GetValue("rbot.antiaim.advanced.exposetype") + 1); 
					exposetype = SenseUI.Combo(exposetype_ley, { "1s", "1.5s" }, exposetype);
					gui.SetValue("rbot.antiaim.advanced.exposetype", exposetype-1);
					local exposetype = gui.GetValue("rbot.antiaim.advanced.exposefake");
					exposetype = SenseUI.Bind("Fake expose toggle", true, exposetype);
					gui.SetValue("rbot.antiaim.advanced.exposefake", exposetype);
					SenseUI.EndGroup();
				end
			
			if SenseUI.BeginGroup( "Aim_other", "Other", 460, 450, 420, 280 ) then

				SenseUI.Label("Slow motion");
				local slowkey = gui.GetValue("rbot.accuracy.movement.slowkey");
				slowkey = SenseUI.Bind("slow", true, slowkey);
			  	gui.SetValue("rbot.accuracy.movement.slowkey", slowkey);

			  	local slowspeed = gui.GetValue("rbot.accuracy.movement.slowspeed");				
			  	slowspeed = SenseUI.Slider("Slow motion peed", 1, 100, "%", "1%", "100%", false, slowspeed);
				gui.SetValue("rbot.accuracy.movement.slowspeed", slowspeed);
				  
				local autostop16= gui.GetValue("rbot.antiaim.condition.shiftonshot");
				autostop16 = SenseUI.Checkbox("On shot anti-aim", autostop16);
				gui.SetValue("rbot.antiaim.condition.shiftonshot", autostop16);

				
				SenseUI.EndGroup();
			end
		end
		
			SenseUI.EndTab();
			if SenseUI.BeginTab( "gunsettings", SenseUI.Icons.legit ) then
				if SenseUI.BeginGroup( "gunssettingss", "Main options", 15, 25, 380, 700 ) then
					local lbot_enable = gui.GetValue("lbot.master");
					lbot_enable = SenseUI.Checkbox("Enable", lbot_enable);
					 gui.SetValue("lbot.master", lbot_enable);

					 local Toggle_enable = gui.GetValue("lbot.aim.enable");
					 Toggle_enable = SenseUI.Checkbox("Toggle enable", Toggle_enable);
					gui.SetValue("lbot.aim.enable", Toggle_enable);				 
					local Toggle_enable_key = gui.GetValue("lbot.aim.key");
					Toggle_enable_key = SenseUI.Bind("Toggle enable", true, Toggle_enable_key);
					gui.SetValue("lbot.aim.key", Toggle_enable_key);

					


					local aimlock23 = gui.GetValue("lbot.aim.fireonpress");
					aimlock23 = SenseUI.Checkbox("Fire on press", aimlock23);
				   gui.SetValue("lbot.aim.fireonpress", aimlock23);
				   local aimlock24 = gui.GetValue("lbot.aim.autofire");
					aimlock24 = SenseUI.Checkbox("Auto fire", aimlock24);
				   gui.SetValue("lbot.aim.autofire", aimlock24);
				   local fov_rr2 = gui.GetValue("lbot.aim.autopistol");				
				   fov_rr2 = SenseUI.Slider("Auto pistol lnterval", 0, 500, "", "0ms", "500ms", false, fov_rr2);
				   gui.SetValue("lbot.aim.autopistol", fov_rr2);
	
	
					SenseUI.Label("Arms");
					weapon_select = SenseUI.Combo(nvmd_rage, { "Shared","Pistol", "Revolver", "Smg", "Rifle", "Shotgun", "Scout", "Auto Aniper", "Awp", "lmg" }, weapon_select );
					if weapon_select == 1 then
					
	
					local ashared_rcs = gui.GetValue("lbot.weapon.accuracy.shared.rcs");
					shared_rcs = SenseUI.Checkbox("Recoil control system", shared_rcs);
					gui.SetValue("lbot.weapon.accuracy.shared.rcs", shared_rcs);
				   
					local ashared_src = gui.GetValue("lbot.weapon.accuracy.shared.src");
					shared_src = SenseUI.Checkbox("Standalone recoil control", shared_src);
					gui.SetValue("lbot.weapon.accuracy.shared.src", shared_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.shared.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.shared.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.shared.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.shared.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.shared.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.shared.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.shared.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.shared.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.shared.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.shared.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.shared.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.shared.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.shared.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.shared.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.shared.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.shared.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.shared.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.shared.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.shared.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.shared.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.shared.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.shared.nearest", nearest_src);
	
				  
					
	
					else if weapon_select == 2 then
						local shared_rcs = gui.GetValue("lbot.weapon.accuracy.pistol.rcs");
					shared_rcs = SenseUI.Checkbox("Recoil control system", shared_rcs);
					gui.SetValue("lbot.weapon.accuracy.pistol.rcs", shared_rcs);
				   
					local ashared_src = gui.GetValue("lbot.weapon.accuracy.pistol.src");
					shared_src = SenseUI.Checkbox("Standalone recoil control", shared_src);
					gui.SetValue("lbot.weapon.accuracy.pistol.src", shared_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.pistol.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.pistol.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.pistol.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.pistol.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.pistol.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.pistol.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.pistol.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.pistol.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.pistol.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.pistol.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.pistol.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.pistol.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.pistol.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.pistol.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.pistol.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.pistol.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.pistol.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.pistol.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.pistol.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.pistol.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.pistol.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.pistol.nearest", nearest_src);
	
						   else if weapon_select == 3 then
							local shared_rcs = gui.GetValue("lbot.weapon.accuracy.hpistol.rcs");
							shared_rcs = SenseUI.Checkbox("Recoil control system", shared_rcs);
							gui.SetValue("lbot.weapon.accuracy.hpistol.rcs", shared_rcs);
						   
				   
					local ahpistol_src = gui.GetValue("lbot.weapon.accuracy.hpistol.src");
					hpistol_src = SenseUI.Checkbox("Standalone recoil control", hpistol_src);
					gui.SetValue("lbot.weapon.accuracy.hpistol.src", hpistol_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.hpistol.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.hpistol.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.hpistol.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.hpistol.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.hpistol.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.hpistol.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.hpistol.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.hpistol.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.hpistol.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.hpistol.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.hpistol.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.hpistol.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.hpistol.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.hpistol.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.hpistol.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.hpistol.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.hpistol.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.hpistol.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.hpistol.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.hpistol.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.hpistol.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.hpistol.nearest", nearest_src);
	
							else if weapon_select == 4 then
								local asmg_rcs = gui.GetValue("lbot.weapon.accuracy.smg.rcs");
					smg_rcs = SenseUI.Checkbox("Recoil control system", smg_rcs);
					gui.SetValue("lbot.weapon.accuracy.smg.rcs", smg_rcs);
				   
					local asmg_src = gui.GetValue("lbot.weapon.accuracy.smg.src");
					smg_src = SenseUI.Checkbox("Standalone recoil control", smg_src);
					gui.SetValue("lbot.weapon.accuracy.smg.src", smg_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.smg.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.smg.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.smg.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.smg.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.smg.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.smg.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.smg.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.smg.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.smg.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.smg.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.smg.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.smg.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.smg.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.smg.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.smg.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.smg.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.smg.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.smg.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.smg.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.smg.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.smg.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.smg.nearest", nearest_src);
	
								else if weapon_select == 5 then
									local arifle_rcs = gui.GetValue("lbot.weapon.accuracy.rifle.rcs");
					rifle_rcs = SenseUI.Checkbox("Recoil control system", rifle_rcs);
					gui.SetValue("lbot.weapon.accuracy.rifle.rcs", rifle_rcs);
				   
					local arifle_src = gui.GetValue("lbot.weapon.accuracy.rifle.src");
					rifle_src = SenseUI.Checkbox("Standalone recoil control", rifle_src);
					gui.SetValue("lbot.weapon.accuracy.rifle.src", rifle_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.rifle.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.rifle.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.rifle.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.rifle.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.rifle.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.rifle.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.rifle.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.rifle.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.rifle.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.rifle.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.rifle.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.rifle.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.rifle.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.rifle.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.rifle.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.rifle.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.rifle.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.rifle.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.rifle.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.rifle.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.rifle.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.rifle.nearest", nearest_src);
	
							   else if weapon_select == 6 then
								local ashotgun_rcs = gui.GetValue("lbot.weapon.accuracy.shotgun.rcs");
					shotgun_rcs = SenseUI.Checkbox("Recoil control system", shotgun_rcs);
					gui.SetValue("lbot.weapon.accuracy.shotgun.rcs", shotgun_rcs);
				   
					local ashotgun_src = gui.GetValue("lbot.weapon.accuracy.shotgun.src");
					shotgun_src = SenseUI.Checkbox("Standalone recoil control", shotgun_src);
					gui.SetValue("lbot.weapon.accuracy.shotgun.src", shotgun_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.shotgun.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.shotgun.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.shotgun.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.shotgun.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.shotgun.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.shotgun.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.shotgun.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.shotgun.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.shotgun.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.shotgun.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.shotgun.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.shotgun.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.shotgun.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.shotgun.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.shotgun.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.shotgun.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.shotgun.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.shotgun.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.shotgun.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.shotgun.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.shotgun.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.shotgun.nearest", nearest_src);
	
									  else if weapon_select == 7 then
										local ascout_rcs = gui.GetValue("lbot.weapon.accuracy.scout.rcs");
					scout_rcs = SenseUI.Checkbox("Recoil control system", scout_rcs);
					gui.SetValue("lbot.weapon.accuracy.scout.rcs", scout_rcs);
				   
					local ascout_src = gui.GetValue("lbot.weapon.accuracy.scout.src");
					scout_src = SenseUI.Checkbox("Standalone recoil control", scout_src);
					gui.SetValue("lbot.weapon.accuracy.scout.src", scout_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.scout.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.scout.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.scout.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.scout.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.scout.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.scout.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.scout.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.scout.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.scout.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.scout.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.scout.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.scout.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.scout.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.scout.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.scout.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.scout.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.scout.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.scout.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.scout.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.scout.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.scout.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.scout.nearest", nearest_src);
	 
											else if weapon_select == 8 then
												local aasniper_rcs = gui.GetValue("lbot.weapon.accuracy.asniper.rcs");
					asniper_rcs = SenseUI.Checkbox("Recoil control system", asniper_rcs);
					gui.SetValue("lbot.weapon.accuracy.asniper.rcs", asniper_rcs);
				   
					local aasniper_src = gui.GetValue("lbot.weapon.accuracy.asniper.src");
					asniper_src = SenseUI.Checkbox("Standalone recoil control", asniper_src);
					gui.SetValue("lbot.weapon.accuracy.asniper.src", asniper_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.asniper.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.asniper.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.asniper.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.asniper.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.asniper.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.asniper.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.asniper.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.asniper.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.asniper.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.asniper.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.asniper.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.asniper.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.asniper.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.asniper.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.asniper.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.asniper.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.asniper.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.asniper.autowall", autowall_src);
					local smoke_src = gui.GetValue("lbot.weapon.vis.asniper.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.asniper.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.asniper.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.asniper.nearest", nearest_src);
	
							  else if weapon_select == 9 then
								local asniper_rcs = gui.GetValue("lbot.weapon.accuracy.sniper.rcs");
					sniper_rcs = SenseUI.Checkbox("Recoil control system", sniper_rcs);
					gui.SetValue("lbot.weapon.accuracy.sniper.rcs", sniper_rcs);
				   
					local asniper_src = gui.GetValue("lbot.weapon.accuracy.sniper.src");
					sniper_src = SenseUI.Checkbox("Standalone recoil control", sniper_src);
					gui.SetValue("lbot.weapon.accuracy.sniper.src", sniper_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.sniper.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.sniper.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.sniper.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.sniper.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.sniper.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.sniper.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.sniper.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.sniper.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.sniper.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.sniper.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.sniper.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.sniper.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.sniper.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.sniper.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.sniper.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.sniper.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.sniper.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.sniper.autowall", autowall_src);
	
	
					local smoke_src = gui.GetValue("lbot.weapon.vis.sniper.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.sniper.smoke", smoke_src);
					local snearest_src = gui.GetValue("lbot.aim.sniper.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.sniper.nearest", nearest_src);
	 
				   else if weapon_select == 10 then
					local lmg2_src = gui.GetValue("lbot.weapon.accuracy.lmg.rcs");
					lmg2_src = SenseUI.Checkbox("Recoil control system", lmg2_src);
					gui.SetValue("lbot.weapon.accuracy.lmg.rcs", lmg2_src);
				   
					local lmg_src = gui.GetValue("lbot.weapon.accuracy.lmg.src");
					lmg_src = SenseUI.Checkbox("Standalone recoil control", lmg_src);
					gui.SetValue("lbot.weapon.accuracy.lmg.src", lmg_src);
	
					local hrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.lmg.hrecoil");				
					hrecoil_rr2 = SenseUI.Slider("Horizontal recoil", 0, 100, "", "0%", "100%", false, hrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.lmg.hrecoil", hrecoil_rr2);
	
				   local vrecoil_rr2 = gui.GetValue("lbot.weapon.accuracy.lmg.vrecoil");				
				   vrecoil_rr2 = SenseUI.Slider("Vertical recoil", 0, 100, "", "0%", "100%", false, vrecoil_rr2);
				   gui.SetValue("lbot.weapon.accuracy.lmg.vrecoil", vrecoil_rr2);
	
				   local smooth_rr2 = gui.GetValue("lbot.weapon.aim.lmg.smooth");				
				   smooth_rr2 = SenseUI.Slider("Smooth factor", 0, 50, "", "0", "50", false, smooth_rr2);
				   gui.SetValue("lbot.weapon.aim.lmg.smooth", smooth_rr2);
				   local randomize_rr2 = gui.GetValue("lbot.weapon.aim.lmg.randomize");				
				   randomize_rr2 = SenseUI.Slider("Randomize factor", 0, 10, "", "0", "10", false, randomize_rr2);
				   gui.SetValue("lbot.weapon.aim.lmg.randomize", randomize_rr2);
				   local minfov_rr2 = gui.GetValue("lbot.weapon.target.lmg.minfov");				
				   minfov_rr2 = SenseUI.Slider("Minimum fov range", 0, 5, "", "0", "5", false, minfov_rr2);
				   gui.SetValue("lbot.weapon.target.lmg.minfov", minfov_rr2);
				   local maxfov_rr2 = gui.GetValue("lbot.weapon.target.lmg.maxfov");				
				   maxfov_rr2 = SenseUI.Slider("Maximum fov range", 0, 30, "", "0", "30", false, maxfov_rr2);
				   gui.SetValue("lbot.weapon.target.lmg.maxfov", maxfov_rr2);
				   local tsd_rr2 = gui.GetValue("lbot.weapon.target.lmg.tsd");				
				   tsd_rr2 = SenseUI.Slider("Target switch delay", 0, 1000, "ms", "0ms", "1000ms", false, tsd_rr2);
				   gui.SetValue("lbot.weapon.target.lmg.tsd", tsd_rr2);
				   local fsd_rr2 = gui.GetValue("lbot.weapon.target.lmg.fsd");				
				   fsd_rr2 = SenseUI.Slider("Firs shot delay", 0, 1000, "ms", "0ms", "1000ms", false, fsd_rr2);
				   gui.SetValue("lbot.weapon.target.lmg.fsd", fsd_rr2);
	
				   local autowall_src = gui.GetValue("lbot.weapon.vis.lmg.autowall");
				   autowall_src = SenseUI.Checkbox("Automatic penetration", autowall_src);
					gui.SetValue("lbot.weapon.vis.lmg.autowall", autowall_src);
	
	
					local smoke_src = gui.GetValue("lbot.weapon.vis.lmg.smoke");
					smoke_src = SenseUI.Checkbox("Through smoke", smoke_src);
					gui.SetValue("lbot.weapon.vis.lmg.smoke", smoke_src);
	
					local snearest_src = gui.GetValue("lbot.aim.lmg.nearest");
					nearest_src = SenseUI.Checkbox("Nearest to crosshair", nearest_src);
					gui.SetValue("lbot.aim.lmg.nearest", nearest_src);
	
	
	
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				SenseUI.EndGroup();
				end
				if SenseUI.BeginGroup( "hitscans", "Other", 410, 25, 380, 700 ) then
					local lbot_enable = gui.GetValue("lbot.trg.enable");
					lbot_enable = SenseUI.Checkbox("Trigger", lbot_enable);
					 gui.SetValue("lbot.trg.enable", lbot_enable);
					 local lbot_enable_key = gui.GetValue("lbot.trg.key");
					 lbot_enable_key = SenseUI.Bind("Trigger key", true, lbot_enable_key);
					 gui.SetValue("lbot.trg.key", lbot_enable_key);

	
					 local aimlock2 = gui.GetValue("lbot.trg.autofire");
					 aimlock2 = SenseUI.Checkbox("Auto fire", aimlock2);
					gui.SetValue("lbot.trg.autofire", aimlock2);
					
				   
					if weapon_select == 1 then
	
						local maxfov_rr2 = gui.GetValue("lbot.trg.shared.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.shared.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.shared.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.shared.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.shared.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.shared.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.shared.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.shared.antirecoil", aimlock23);
	
						
	 
					   else if weapon_select == 2 then
						local maxfov_rr2 = gui.GetValue("lbot.trg.pistol.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.pistol.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.pistol.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.pistol.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.pistol.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.pistol.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.pistol.antirecoil");
						aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
						gui.SetValue("lbot.trg.pistol.antirecoil", aimlock23);
	
						  else if weapon_select == 3 then
							local maxfov_rr2 = gui.GetValue("lbot.trg.hpistol.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.hpistol.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.hpistol.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.hpistol.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.hpistol.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.hpistol.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.hpistol.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.hpistol.antirecoil", aimlock23);
		
								else if weapon_select == 4 then
									local maxfov_rr2 = gui.GetValue("lbot.trg.smg.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.smg.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.smg.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.smg.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.smg.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.smg.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.smg.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.smg.antirecoil", aimlock23);
	
									else if weapon_select == 5 then
										local maxfov_rr2 = gui.GetValue("lbot.trg.rifle.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.rifle.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.rifle.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.rifle.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.rifle.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.rifle.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.rifle.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.rifle.antirecoil", aimlock23);
	 
							   else if weapon_select == 6 then
								local maxfov_rr2 = gui.GetValue("lbot.trg.shotgun.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.shotgun.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.shotgun.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.shotgun.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.shotgun.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.shotgun.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.shotgun.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.shotgun.antirecoil", aimlock23);
	
									else if weapon_select == 7 then
												   local maxfov_rr2 = gui.GetValue("lbot.trg.scout.delay");				
						  maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
							gui.SetValue("lbot.trg.scout.delay", maxfov_rr2);
						  local tsd_rr2 = gui.GetValue("lbot.trg.scout.burst");				
						   tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						   gui.SetValue("lbot.trg.scout.burst", tsd_rr2);
							local fsd_rr2 = gui.GetValue("lbot.trg.scout.hitchance");				
						  fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						   gui.SetValue("lbot.trg.scout.hitchance", fsd_rr2);
	
						  local aimlock23 = gui.GetValue("lbot.trg.scout.antirecoil");
					   aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
					   gui.SetValue("lbot.trg.scout.antirecoil", aimlock23);
	
											else if weapon_select == 8 then
												local maxfov_rr2 = gui.GetValue("lbot.trg.asniper.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.asniper.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.asniper.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.asniper.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.asniper.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.asniper.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.asniper.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.asniper.antirecoil", aimlock23);
										   
													else if weapon_select == 9 then
														local maxfov_rr2 = gui.GetValue("lbot.trg.sniper.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.sniper.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.sniper.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.sniper.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.sniper.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.sniper.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.sniper.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.sniper.antirecoil", aimlock23);
	   
												else if weapon_select == 10 then
													local maxfov_rr2 = gui.GetValue("lbot.trg.lmg.delay");				
						maxfov_rr2 = SenseUI.Slider("Trigger delay", 0, 500, "ms", "0ms", "500ms", false, maxfov_rr2);
						gui.SetValue("lbot.trg.lmg.delay", maxfov_rr2);
						local tsd_rr2 = gui.GetValue("lbot.trg.lmg.burst");				
						tsd_rr2 = SenseUI.Slider("Trigger burst", 0, 500, "ms", "0ms", "500ms", false, tsd_rr2);
						gui.SetValue("lbot.trg.lmg.burst", tsd_rr2);
						local fsd_rr2 = gui.GetValue("lbot.trg.lmg.hitchance");				
						fsd_rr2 = SenseUI.Slider("Hic chance", 0, 100, "%", "0%", "100%", false, fsd_rr2);
						gui.SetValue("lbot.trg.lmg.hitchance", fsd_rr2);
	
						local aimlock23 = gui.GetValue("lbot.trg.lmg.antirecoil");
					aimlock23 = SenseUI.Checkbox("Anti-recoil", aimlock23);
				   gui.SetValue("lbot.trg.lmg.antirecoil", aimlock23);
													end                                            
													end
												end
											end
										end
									end
								end
							end
							
						end
						end
						local walkcustom_enable = gui.GetValue("lbot.movement.walkcustom");
						walkcustom_enable = SenseUI.Checkbox("Walk speed customization", walkcustom_enable);
					 gui.SetValue("lbot.movement.walkcustom", walkcustom_enable);
					 local walkcustom_rr2 = gui.GetValue("lbot.movement.walkspeed");				
					 walkcustom_rr2 = SenseUI.Slider("Walk speed", 75, 135, "", "75", "135", false, walkcustom_rr2);
					 gui.SetValue("lbot.movement.walkspeed", walkcustom_rr2);
	
					 local quickstop_enable = gui.GetValue("lbot.movement.quickstop");
					 quickstop_enable = SenseUI.Checkbox("Quick stop", quickstop_enable);
					 gui.SetValue("lbot.movement.quickstop", quickstop_enable);
					 local autostop_enable = gui.GetValue("lbot.semirage.autostop");
					 autostop_enable = SenseUI.Checkbox("Auto stop", autostop_enable);
					 gui.SetValue("lbot.semirage.autostop", autostop_enable);
					 local knifetrigger_enable = gui.GetValue("lbot.extra.knifetrigger");
					 knifetrigger_enable = SenseUI.Checkbox("Knife triggerbot", knifetrigger_enable);
					 gui.SetValue("lbot.extra.knifetrigger", knifetrigger_enable);
					 local resolver_enable = gui.GetValue("lbot.posadj.resolver");
					 resolver_enable = SenseUI.Checkbox("Resolver", resolver_enable);
					 gui.SetValue("lbot.posadj.resolver", resolver_enable);
					 local backtrack_enable = gui.GetValue("lbot.posadj.backtrack");
					 backtrack_enable = SenseUI.Checkbox("Backtrack ing", backtrack_enable);
					 gui.SetValue("lbot.posadj.backtrack", backtrack_enable);
					 local backtrack_rr2 = gui.GetValue("lbot.extra.backtrack");				
					 backtrack_rr2 = SenseUI.Slider("Backtrack Time", 0, 400, "ms", "0ms", "400ms", false, backtrack_rr2);
					 gui.SetValue("lbot.extra.backtrack", backtrack_rr2);
					 local silentaimbot_enable = gui.GetValue("lbot.semirage.silentaimbot");
					 silentaimbot_enable = SenseUI.Checkbox("Silent aimbot", silentaimbot_enable);
					 gui.SetValue("lbot.semirage.silentaimbot", silentaimbot_enable);
	
	
	
	
				SenseUI.EndGroup();
				end
			end
			SenseUI.EndTab();
			if SenseUI.BeginTab( "vissettings", SenseUI.Icons.visuals ) then            
				if SenseUI.BeginGroup( "visual1", "Visuals", 15, 25, 380, 700 ) then
					local enemy_filter = gui.GetValue("esp.master");
						 enemy_filter = SenseUI.Checkbox("Enable", enemy_filter);
						 gui.SetValue("esp.master", enemy_filter);
					SenseUI.Label("Choose");
					pselect = SenseUI.Combo("", { "Enemy", "Friendly",  "Arms","Local", "Skins", "Other" }, pselect);
					if pselect == 1 then                  	
						SenseUI.Label("Box");
						local enemy_box = (gui.GetValue("esp.overlay.enemy.box") + 1);
						enemy_box = SenseUI.Combo(enemy_nox, { "Off", "Outlined", "Normal" }, enemy_box);
						gui.SetValue("esp.overlay.enemy.box", enemy_box-1);
						local enemy_outline = gui.GetValue("esp.overlay.enemy.precision");
						enemy_outline = SenseUI.Checkbox("Box precision", enemy_outline);
						gui.SetValue("esp.overlay.enemy.precision", enemy_outline);
						local enemy_name = gui.GetValue("esp.overlay.enemy.name");
						enemy_name = SenseUI.Checkbox("Name", enemy_name);
						gui.SetValue("esp.overlay.enemy.name", enemy_name);
						local enemy_dormant = gui.GetValue("esp.overlay.enemy.health.healthnum");
						enemy_dormant = SenseUI.Checkbox("Health bar", enemy_dormant);
						gui.SetValue("esp.overlay.enemy.health.healthnum", enemy_dormant);
						local enemy_dormant = gui.GetValue("esp.overlay.enemy.health.healthbar");
						enemy_dormant = SenseUI.Checkbox("Health Number", enemy_dormant);
						gui.SetValue("esp.overlay.enemy.health.healthbar", enemy_dormant);
						local enemy_precision = gui.GetValue("esp.overlay.enemy.skeleton");
						enemy_precision = SenseUI.Checkbox("Skeleton", enemy_precision);
						gui.SetValue("esp.overlay.enemy.skeleton", enemy_precision);
						local enemy_armor = gui.GetValue("esp.overlay.enemy.armor");
						enemy_armor = SenseUI.Checkbox("Armor", enemy_armor);
						gui.SetValue("esp.overlay.enemy.armor", enemy_armor);
						local enemy_ammo = gui.GetValue("esp.overlay.enemy.ammo");
						enemy_ammo = SenseUI.Checkbox("Ammo", enemy_ammo);
						gui.SetValue("esp.overlay.enemy.ammo", enemy_ammo);
						local enemy_money = gui.GetValue("esp.overlay.enemy.money");
						enemy_money = SenseUI.Checkbox("Money", enemy_money);
						gui.SetValue("esp.overlay.enemy.money", enemy_money);
						local enemy_barrel = gui.GetValue("esp.overlay.enemy.barrel");
						enemy_barrel = SenseUI.Checkbox("Barrel", enemy_barrel);
						gui.SetValue("esp.overlay.enemy.barrel", enemy_barrel);
						local enemy_dormant = gui.GetValue("esp.overlay.enemy.dormant");
						enemy_dormant = SenseUI.Checkbox("Dormant", enemy_dormant);
						gui.SetValue("esp.overlay.enemy.dormant", enemy_dormant); 
						local enemy_ettracer1 = gui.GetValue("esp.world.bullettracerfilter.enemy");
						enemy_ettracer1 = SenseUI.Checkbox("Bullet tracer filter", enemy_ettracer1);
						gui.SetValue("esp.world.bullettracerfilter.enemy", enemy_ettracer1);                      
						local enemy_ettracer2 = gui.GetValue("esp.world.inferno.enemy");
						enemy_ettracer2 = SenseUI.Checkbox("Inferno", enemy_ettracer2);
						gui.SetValue("esp.world.inferno.enemy", enemy_ettracer2);
						local enemy_ettracer3 = gui.GetValue("esp.world.nadetracer.enemy");
						enemy_ettracer3 = SenseUI.Checkbox("Grenade tracer", enemy_ettracer3);
						gui.SetValue("esp.world.nadetracer.enemy", enemy_ettracer3);                   
						local enemy_ettracer4 = gui.GetValue("esp.world.nadewarning.enemy");
						enemy_ettracer4 = SenseUI.Checkbox("Grenade warning", enemy_ettracer4);
						gui.SetValue("esp.world.nadewarning.enemy", enemy_ettracer4);
						enemy_flags = SenseUI.MultiCombo("Flags", { "Has C4", "Has Defuser", "Defusing", "Planting","Flashed", "Scoped", "Reloading" }, team_flags);
						gui.SetValue("esp.overlay.enemy.hasc4", enemy_flags["持有C4"]);
						gui.SetValue("esp.overlay.enemy.hasdefuser", enemy_flags["有拆弹器"]);
						gui.SetValue("esp.overlay.enemy.defusing", enemy_flags["正在拆弹"]);
						gui.SetValue("esp.overlay.enemy.planting", enemy_flags["正在安装C4"]);
						gui.SetValue("esp.overlay.enemy.flashed", enemy_flags["已经致盲"]);
						gui.SetValue("esp.overlay.enemy.scoped", enemy_flags["正在开镜"]);
						gui.SetValue("esp.overlay.enemy.reloading", enemy_flags["正在装弹"]);
						SenseUI.Label("Weapon filter");
						local espenemy_weapon2 = (gui.GetValue("esp.overlay.enemy.weapon") + 1);
						espenemy_weapon2 = SenseUI.Combo("espenemy_weapon", { "Active", "Active+Nades", "All" }, espenemy_weapon2);
						gui.SetValue("esp.overlay.enemy.weapon", espenemy_weapon2-1);
						SenseUI.Label("Out of view");
						local espenemy_weapon3 = (gui.GetValue("esp.local.outofview") + 1);
						espenemy_weapon3 = SenseUI.Combo("espenemy_weapon3", { "Off", "Arrow", "Arrow+Info" }, espenemy_weapon3);
						gui.SetValue("esp.local.outofview", espenemy_weapon3-1);
						if espenemy_weapon3  > 1 then
							local espenemy_outofviewscale = gui.GetValue("esp.local.outofviewscale");
							espenemy_outofviewscale  = SenseUI.Slider("Out of view scale", 10, 100, "%", "10%", "100%", false, espenemy_outofviewscale );
							gui.SetValue("esp.local.outofviewscale", espenemy_outofviewscale );
									 end
	
						local enemy_ettracer5 = gui.GetValue("esp.other.norenderenemy");
						enemy_ettracer5 = SenseUI.Checkbox("Disable models", enemy_ettracer5);
						gui.SetValue("esp.other.norenderenemy", enemy_ettracer5);
						local enemy_ettracer6 = gui.GetValue("esp.world.dmgindicator");
						enemy_ettracer6 = SenseUI.Checkbox("Dmgege indicator", enemy_ettracer6);
						gui.SetValue("esp.world.dmgindicator", enemy_ettracer6);
						local enemy_damage = gui.GetValue("misc.log.damage.enemy");
						enemy_damage = SenseUI.Checkbox("Log Damage", enemy_damage);
								gui.SetValue("misc.log.damage.enemy", enemy_damage);
	
						
	
					else if pselect == 2 then                  	
							SenseUI.Label("Box");
							local friendly_box = (gui.GetValue("esp.overlay.friendly.box") + 1);
							friendly_box = SenseUI.Combo(friendly_nox, { "Off", "Outlined", "Normal" }, friendly_box);
							gui.SetValue("esp.overlay.friendly.box", friendly_box-1);
							local friendly_outline = gui.GetValue("esp.overlay.friendly.precision");
							friendly_outline = SenseUI.Checkbox("Box precision", friendly_outline);
							gui.SetValue("esp.overlay.friendly.precision", friendly_outline);
							local friendly_name = gui.GetValue("esp.overlay.friendly.name");
							friendly_name = SenseUI.Checkbox("Name", friendly_name);
							gui.SetValue("esp.overlay.friendly.name", friendly_name);
							local friendly_dormant = gui.GetValue("esp.overlay.friendly.health.healthnum");
							friendly_dormant = SenseUI.Checkbox("Health bar", friendly_dormant);
							gui.SetValue("esp.overlay.friendly.health.healthnum", friendly_dormant);
							local friendly_dormant = gui.GetValue("esp.overlay.friendly.health.healthbar");
							friendly_dormant = SenseUI.Checkbox("Health Number", friendly_dormant);
							gui.SetValue("esp.overlay.friendly.health.healthbar", friendly_dormant);
							local friendly_precision = gui.GetValue("esp.overlay.friendly.skeleton");
							friendly_precision = SenseUI.Checkbox("Skeleton", friendly_precision);
							gui.SetValue("esp.overlay.friendly.skeleton", friendly_precision);
							local friendly_armor = gui.GetValue("esp.overlay.friendly.armor");
							friendly_armor = SenseUI.Checkbox("Armor", friendly_armor);
							gui.SetValue("esp.overlay.friendly.armor", friendly_armor);
							local friendly_ammo = gui.GetValue("esp.overlay.friendly.ammo");
							friendly_ammo = SenseUI.Checkbox("Ammo", friendly_ammo);
							gui.SetValue("esp.overlay.friendly.ammo", friendly_ammo);
							local friendly_money = gui.GetValue("esp.overlay.friendly.money");
							friendly_money = SenseUI.Checkbox("Money", friendly_money);
							gui.SetValue("esp.overlay.friendly.money", friendly_money);
							local friendly_barrel = gui.GetValue("esp.overlay.friendly.barrel");
							friendly_barrel = SenseUI.Checkbox("Barrel", friendly_barrel);
							gui.SetValue("esp.overlay.friendly.barrel", friendly_barrel);
							local friendly_dormant = gui.GetValue("esp.overlay.friendly.dormant");
							friendly_dormant = SenseUI.Checkbox("Dormant", friendly_dormant);
							gui.SetValue("esp.overlay.friendly.dormant", friendly_dormant); 
							local friendly_ettracer1 = gui.GetValue("esp.world.bullettracerfilter.friendly");
							friendly_ettracer1 = SenseUI.Checkbox("Bullet tracer filter", friendly_ettracer1);
							gui.SetValue("esp.world.bullettracerfilter.friendly", friendly_ettracer1);                      
							local friendly_ettracer2 = gui.GetValue("esp.world.inferno.friendly");
							friendly_ettracer2 = SenseUI.Checkbox("Inferno", friendly_ettracer2);
							gui.SetValue("esp.world.inferno.friendly", friendly_ettracer2);
							local friendly_ettracer3 = gui.GetValue("esp.world.nadetracer.friendly");
							friendly_ettracer3 = SenseUI.Checkbox("Grenade tracer", friendly_ettracer3);
							gui.SetValue("esp.world.nadetracer.friendly", friendly_ettracer3);                   
							local friendly_ettracer4 = gui.GetValue("esp.world.nadewarning.friendly");
							friendly_ettracer4 = SenseUI.Checkbox("Grenade warning", friendly_ettracer4);
							gui.SetValue("esp.world.nadewarning.friendly", friendly_ettracer4);              
							friendly_flags = SenseUI.MultiCombo("Flags", { "Has C4", "Has Defuser", "Defusing", "Planting","Flashed", "Scoped", "Reloading" }, team_flags);
							gui.SetValue("esp.overlay.friendly.hasc4", friendly_flags["持有C4"]);
							gui.SetValue("esp.overlay.friendly.hasdefuser", friendly_flags["有拆弹器"]);
							gui.SetValue("esp.overlay.friendly.defusing", friendly_flags["正在拆弹"]);
							gui.SetValue("esp.overlay.friendly.planting", friendly_flags["正在安装C4"]);
							gui.SetValue("esp.overlay.friendly.flashed", friendly_flags["已经致盲"]);
							gui.SetValue("esp.overlay.friendly.scoped", friendly_flags["正在开镜"]);
							gui.SetValue("esp.overlay.friendly.reloading", friendly_flags["正在装弹"]);
							SenseUI.Label("Weapon filter");
							local espfriendly_weapon2 = (gui.GetValue("esp.overlay.friendly.weapon") + 1);
							espfriendly_weapon2 = SenseUI.Combo("espreny_weaon", { "Active", "Active+Nades", "All" }, espfriendly_weapon2);
							gui.SetValue("esp.overlay.friendly.weapon", espfriendly_weapon2-1);
							local friendly_ettracer5 = gui.GetValue("esp.other.norenderteam");
							friendly_ettracer5 = SenseUI.Checkbox("Disable models", friendly_ettracer5);
							local friendly_damage = gui.GetValue("misc.log.damage.friendly");
								friendly_damage = SenseUI.Checkbox("Log Damage", friendly_damage);
								gui.SetValue("misc.log.damage.friendly", friendly_damage);
						gui.SetValue("esp.other.norenderteam", friendly_damage);
	
						else   if pselect == 3 then 
							local weapon_ammo = gui.GetValue("esp.overlay.weapon.ammo");
							weapon_ammo = SenseUI.Checkbox("Ammo", weapon_ammo);
							gui.SetValue("esp.overlay.weapon.ammo", weapon_ammo);
							SenseUI.Label("Name");
								local weapon_name = (gui.GetValue("esp.overlay.weapon.name") + 1);
								weapon_name = SenseUI.Combo(weapon_name, { "Off", "Icon", "Name" }, weapon_name);
								gui.SetValue("esp.overlay.weapon.name", weapon_name-1)
							local c4timer_ammo = gui.GetValue("esp.overlay.weapon.c4timer");
							c4timer_ammo = SenseUI.Checkbox("C4 Timer", c4timer_ammo);
							gui.SetValue("esp.overlay.weapon.c4timer", c4timer_ammo);
							local dzitems_ammo = gui.GetValue("esp.overlay.weapon.dzitems");
							dzitems_ammo = SenseUI.Checkbox("Danger Zone Ltems", dzitems_ammo);
							gui.SetValue("esp.overlay.weapon.dzitems", dzitems_ammo);
							local dzturret_ammo = gui.GetValue("esp.overlay.weapon.dzturret");
							dzturret_ammo = SenseUI.Checkbox("Danger Zone Turret", dzturret_ammo);
							gui.SetValue("esp.overlay.weapon.dzturret", dzturret_ammo);                 	
								SenseUI.Label("Box");
								local weapon_box = (gui.GetValue("esp.overlay.weapon.box") + 1);
								weapon_box = SenseUI.Combo(weapon_nox, { "Off", "Outlined", "Normal" }, weapon_box);
								gui.SetValue("esp.overlay.weapon.box", weapon_box-1);
								  
								local weapon_wallbanginfo = gui.GetValue("esp.local.wallbanginfo.dmg");
							weapon_wallbanginfo = SenseUI.Checkbox("Wallbang info damage", weapon_wallbanginfo);
							gui.SetValue("esp.local.wallbanginfo.dmg", weapon_wallbanginfo);
							local weapon_wallbanginfogrid = gui.GetValue("esp.local.wallbanginfo.grid");
							weapon_wallbanginfogrid = SenseUI.Checkbox("Wallbang info grid", weapon_wallbanginfogrid);
							gui.SetValue("esp.local.wallbanginfo.grid", weapon_wallbanginfogrid);
							local weapon_norender5 = gui.GetValue("esp.other.norenderweapon");
							weapon_norender5 = SenseUI.Checkbox("Disable models", weapon_norender5);
						gui.SetValue("esp.other.norenderweapon", weapon_norender5)
						local weapon_noscope5 = gui.GetValue("esp.other.noscope");
							weapon_noscope5 = SenseUI.Checkbox("No scope", weapon_noscope5);
						gui.SetValue("esp.other.noscope", weapon_noscope5)
						local weapon_noscopedirt5 = gui.GetValue("esp.other.noscopedirt");
							weapon_noscopedirt5 = SenseUI.Checkbox("No scopedirt", weapon_noscopedirt5);
						gui.SetValue("esp.other.noscopedirt", weapon_noscopedirt5)
						local weapon_noscopeoverlay5 = gui.GetValue("esp.other.noscopeoverlay");
							weapon_noscopeoverlay5 = SenseUI.Checkbox("No scope overlay", weapon_noscopeoverlay5);
						gui.SetValue("esp.other.noscopeoverlay", weapon_noscopeoverlay5)
						local weapon_norecoil5 = gui.GetValue("esp.other.norecoil");
							weapon_norecoil5 = SenseUI.Checkbox("no recoil", weapon_norecoil5);
						gui.SetValue("esp.other.norecoil", weapon_norecoil5)
						local weapon_crosshair = gui.GetValue("esp.other.crosshair");
							weapon_crosshair = SenseUI.Checkbox("Crosshair", weapon_crosshair);
						gui.SetValue("esp.other.crosshair", weapon_crosshair)
						local weapon_recoilcrosshair = (gui.GetValue("esp.other.recoilcrosshair") + 1);
						weapon_recoilcrosshair = SenseUI.Combo("esp.oer.crossar", { "Off", "Line", "Fade" }, weapon_recoilcrosshair);
						gui.SetValue("esp.other.recoilcrosshair", weapon_recoilcrosshair-1);
						local weapon_marker = gui.GetValue("esp.world.hiteffects.marker");
							weapon_marker = SenseUI.Checkbox("Hiteffects marker", weapon_marker);
						gui.SetValue("esp.world.hiteffects.marker", weapon_marker)
						local weapon_sound = gui.GetValue("esp.world.hiteffects.sound");
							weapon_sound = SenseUI.Checkbox("Hiteffects sound", weapon_sound);
						gui.SetValue("esp.world.hiteffects.sound", weapon_sound)
					else   if pselect == 4 then 
						
	
						local local_thirdperson= gui.GetValue("esp.local.thirdperson");
						local_thirdperson = SenseUI.Checkbox("Third person enable", local_thirdperson);
						gui.SetValue("esp.local.thirdperson", local_thirdperson)
						
						 local local_thirdpersondis = gui.GetValue("esp.local.thirdpersondist");
						local_thirdpersondis  = SenseUI.Slider("Third person distance", 0, 500, "", "0", "500", false, local_thirdpersondis );
						 gui.SetValue("esp.local.thirdpersondist", local_thirdpersondis );
					   local local_fov = gui.GetValue("esp.local.fov");
					   local_fov  = SenseUI.Slider("View FOV", 50, 120, "", "50", "120", false, local_fov );
					   gui.SetValue("esp.local.fov", local_fov );
	
						local local_viewmodelfov = gui.GetValue("esp.local.viewmodelfov");
						local_viewmodelfov  = SenseUI.Slider("Viewmodel FOV", 40, 90, "", "40", "90", false, local_viewmodelfov );
						gui.SetValue("esp.local.viewmodelfov", local_viewmodelfov );
	
						local local_killfeed= gui.GetValue("esp.other.killfeed");
						local_skillfeed = SenseUI.Checkbox("Preserve Killfeed", local_killfeed);
						gui.SetValue("esp.other.killfeed", local_killfeed)
	
						local local_nosmoke = gui.GetValue("esp.other.nosmoke");
								local_nosmoke = SenseUI.Checkbox("No smoke", local_nosmoke);
								gui.SetValue("esp.other.nosmoke", local_nosmoke);  
	
						local local_bullettracerfilter = gui.GetValue("esp.world.bullettracerfilter.local");
						local_bullettracerfilter = SenseUI.Checkbox("Bullet tracer filter", local_bullettracerfilter);
							gui.SetValue("esp.world.bullettracerfilter.local", local_bullettracerfilter); 
	
						SenseUI.Label("Bullet tracers mode");
								local local_bullettracer = (gui.GetValue("esp.world.bullettracer") + 1);
								local_bullettracer = SenseUI.Combo(local_bullettracer, { "Off", "Latest", "All" }, local_bullettracer);
								gui.SetValue("esp.world.bullettracer", local_bullettracer-1);
								local local_wallbanginfo = gui.GetValue("esp.world.bullettracer");
	
								local local_ettracer2 = gui.GetValue("esp.world.inferno.local");
								local_ettracer2 = SenseUI.Checkbox("Inferno", local_ettracer2);
								gui.SetValue("esp.world.inferno.local", local_ettracer2);
								local local_ettracer3 = gui.GetValue("esp.world.nadetracer.local");
								local_ettracer3 = SenseUI.Checkbox("Grenade tracer", local_ettracer3);
								gui.SetValue("esp.world.nadetracer.local", local_ettracer3);                   
								local local_ettracer4 = gui.GetValue("esp.world.nadewarning.local");
								local_ettracer4 = SenseUI.Checkbox("Grenade warning", local_ettracer4);
								gui.SetValue("esp.world.nadewarning.local", local_ettracer4);  
	
								local local_noflash = gui.GetValue("esp.other.noflash");
								local_noflash = SenseUI.Checkbox("No flash", local_noflash);
								gui.SetValue("esp.other.noflash", local_noflash);                   
								local local_nosmoke = gui.GetValue("esp.other.nosmoke");
								local_nosmoke = SenseUI.Checkbox("No smoke", local_nosmoke);
								gui.SetValue("esp.other.nosmoke", local_nosmoke); 
	
								local local_showspec = gui.GetValue("misc.showspec");
								local_showspec = SenseUI.Checkbox("Show spectators", local_showspec);
								gui.SetValue("misc.showspec", local_showspec);  
	
								local local_damage = gui.GetValue("misc.log.damage.local");
								local_damage = SenseUI.Checkbox("Log Damage", local_damage);
								gui.SetValue("misc.log.damage.local", local_damage);  
								
							else   if pselect == 5 then 
							   
								local walls_walls = gui.GetValue("esp.world.materials.walls");
								walls_walls = SenseUI.Checkbox("Wall color", walls_walls);
								gui.SetValue("esp.world.materials.walls", walls_walls);
								local walls_staticprops = gui.GetValue("esp.world.materials.staticprops");
								walls_staticprops = SenseUI.Checkbox("Static props color", walls_staticprops);
								gui.SetValue("esp.world.materials.staticprops", walls_staticprops);
								local skybox = (gui.GetValue("esp.world.materials.skybox") + 1);
								SenseUI.Label("Skybox");
								skybox = SenseUI.Combo("skybox", { "Dlsabled", "Default", "Cs_tibet" , "Embassy", "Italu", "Jungle", "Office", "Sky_cs15_dayligh01_hdr", "Sky_csgo_cloudy01", "Sky_csgo_night02", "Sky_csgo_night02b" , "Sky_day02_05_hdr", "Sky_day02_05", "Sky_dust", "Vertigo_hdr", "Vertigoblue_hdr", "Vertigo", "Vietnam"}, skybox);
								gui.SetValue("esp.world.materials.skybox", skybox-1);
									end
								end
							end
						end
					end
					SenseUI.EndGroup();
				end
				if SenseUI.BeginGroup( "visual2", "Other", 410, 25, 380, 700 ) then
				 
					SenseUI.EndGroup();
				end
			end
			SenseUI.EndTab();
			if SenseUI.BeginTab( "miscsettings", SenseUI.Icons.settings ) then
				if SenseUI.BeginGroup("cfg.load", "Configurations", 410, 350, 380, 380) then
					selected, scroll = SenseUI.Listbox(configs, 5, false, selected, nil, scroll)
					
					load_pressed = SenseUI.Button("Load", 155, 25)
					save_pressed = SenseUI.Button("Save", 155, 25)
					configname = SenseUI.Textbox("ncfgtb", "Name", configname)
					add_pressed = SenseUI.Button("Create", 155, 25)
					remove_pressed = SenseUI.Button("Delete", 155, 25)
				end
				SenseUI.EndGroup();
				if SenseUI.BeginGroup( "misc2", "Other", 410, 25, 380, 300 ) then
					
					local fakelagenable = gui.GetValue("misc.fakelatency.enable");
					fakelagenable = SenseUI.Checkbox("Fakelatency", fakelagenable);
					gui.SetValue("misc.fakelatency.enable", fakelagenable);
					local fakelatsl = (gui.GetValue("misc.fakelatency.amount") * 1000);
					fakelatsl = SenseUI.Slider("Fakelatency Amount", 0, 1000, "ms", "0ms", "1000ms", false, fakelatsl);
					gui.SetValue("misc.fakelatency.amount", fakelatsl/1000);
	
					
					SenseUI.Label("Fakelag type");
					local fakelagmode = (gui.GetValue("misc.fakelag.type") + 1 );
					fakelagmode = SenseUI.Combo(fakelagmode, { "Normal","Adaptive","Random" ,"Switch"}, fakelagmode);
					gui.SetValue("misc.fakelag.type", fakelagmode-1);
					local fakelagewsh = gui.GetValue("misc.fakelag.condition.inair");
					fakelagewsh = SenseUI.Checkbox("Conditions in air", fakelagewsh);
					gui.SetValue("misc.fakelag.condition.inair", fakelagewsh);
					local fakelagwst = gui.GetValue("misc.fakelag.condition.moving");
					fakelagwst = SenseUI.Checkbox("Conditions moving", fakelagwst);
					gui.SetValue("misc.fakelag.condition.moving", fakelagwst);
					local fakelagwund = gui.GetValue("misc.fakelag.condition.standing");
					fakelagwund = SenseUI.Checkbox("Conditions standing", fakelagwund);
					gui.SetValue("misc.fakelag.condition.standing", fakelagwund);
					local fakelagpeek = gui.GetValue("misc.fakelag.condition.peek");
					fakelagpeek = SenseUI.Checkbox("Conditions peek", fakelagpeek);
					gui.SetValue("misc.fakelag.condition.peek", fakelagpeek);
					
					
				end
				SenseUI.EndGroup();
				if SenseUI.BeginGroup( "misc", "Other", 15, 25, 380, 700 ) then
					local msc_active = gui.GetValue("misc.strafe.enable");
					msc_active = SenseUI.Checkbox("Strafe", msc_active);
					gui.SetValue("misc.strafe.enable", msc_active);
					SenseUI.Label("Auto jump");
					local bunnyhop = (gui.GetValue("misc.autojump") + 1);
					bunnyhop = SenseUI.Combo("bhop", { "Off", "Perfect", "Legit" }, bunnyhop);
					gui.SetValue("misc.autojump", bunnyhop-1);
					local astrafe = gui.GetValue("misc.strafe.wasd");
					astrafe = SenseUI.Checkbox("WASD-Movement", astrafe);
					gui.SetValue("misc.strafe.wasd", astrafe);
					SenseUI.Label("Strafe mode");
					local mode = (gui.GetValue("misc.strafe.mode") + 1);
					mode = SenseUI.Combo("combo1212", { "Silent","Normal","Sidewaye","W-","Mouse" }, mode);
					gui.SetValue("misc.strafe.mode",mode-1);
					
					
					local revealranks = gui.GetValue("misc.rankreveal");
					revealranks = SenseUI.Checkbox("Show ranks", revealranks);
					gui.SetValue("misc.rankreveal", revealranks);
					local weaplog = gui.GetValue("misc.log.purchases");
					weaplog = SenseUI.Checkbox("Log purchases", weaplog);
					gui.SetValue("misc.log.purchases", weaplog);
					gui.SetValue("misc.log.purchases", 1);
					local damagelog = gui.GetValue("misc.log.damage.local");
					damagelog = SenseUI.Checkbox("Log demage", damagelog);
					gui.SetValue("misc.log.damage.local", damagelog);
					gui.SetValue("misc.log.damage.local", 1);
					local duckjump = gui.GetValue("misc.duckjump");
					duckjump = SenseUI.Checkbox("Edge jump", duckjump);
					gui.SetValue("misc.duckjump", duckjump);
					local fastduck = gui.GetValue("misc.fastduck");
					fastduck = SenseUI.Checkbox("Fast duck", fastduck);
					gui.SetValue("misc.fastduck", fastduck);
					local slidewalk = gui.GetValue("misc.slidewalk");
					slidewalk = SenseUI.Checkbox("Slide walk", slidewalk);
					gui.SetValue("misc.slidewalk", slidewalk);
					local autothrow = gui.GetValue("misc.autothrow");
					autothrow = SenseUI.Checkbox("Autothrow", autothrow);
					gui.SetValue("misc.autothrow", autothrow);
					local autothrowgrenade = (gui.GetValue("misc.autothrowgrenade") + 0.5);
					autothrowgrenade = SenseUI.Slider("Grenade distance", 0.5, 10, "", "0", "11", false, autothrowgrenade);
					gui.SetValue("misc.autothrowgrenade", autothrowgrenade - 0.5);
					local autothrowincendiary = (gui.GetValue("misc.autothrowincendiary") + 0.5);
					autothrowincendiary = SenseUI.Slider("Incendiary distance", 0.5, 10, "", "0", "11", false, autothrowincendiary);
					gui.SetValue("misc.autothrowincendiary", autothrowincendiary - 0.5);
	
					local autoaccept = gui.GetValue("misc.autoaccept");
					autoaccept = SenseUI.Checkbox("Auto-Accept match", autoaccept);
					gui.SetValue("misc.autoaccept", autoaccept);
				   
					
					local clantag = gui.GetValue("misc.clantag");
					clantag = SenseUI.Checkbox("Clantag changer", clantag);
					gui.SetValue("misc.clantag", clantag);
					local namespam = gui.GetValue("misc.chatspam");
					namespam = SenseUI.Checkbox("chat spam", namespam);
					gui.SetValue("misc.chatspam", namespam);
					local invisiblename = gui.GetValue("misc.invisiblename");
					invisiblename = SenseUI.Checkbox("Invisible name", invisiblename);
					gui.SetValue("misc.invisiblename", invisiblename);
					SenseUI.Label( "Open menu key" );
					window_bkey, window_bact, window_bdet = SenseUI.Bind( "wndToggle", false, window_bkey, window_bact, window_bdet );
				   
					local bypasscl = gui.GetValue("misc.bypasspure");
					bypasscl = SenseUI.Checkbox("Bypass sv-pure", bypasscl);
					gui.SetValue("misc.bypasspure", bypasscl);
					local bypasspure = gui.GetValue("misc.bypasscheats");
					bypasspure = SenseUI.Checkbox("Bypass sv-cheats", bypasspure);
					gui.SetValue("misc.bypasscheats", bypasspure);
				end
				SenseUI.EndGroup();
			end
			SenseUI.EndTab();
			if SenseUI.BeginTab( "skinc", SenseUI.Icons.skinchanger ) then
				if SenseUI.BeginGroup( "Skin Changer", "Skins", 25, 25, 235, 70 ) then
					local skinc = gui.GetValue("esp.skins.enable");
					skinc = SenseUI.Checkbox("Skins enable", skinc);
					gui.SetValue("esp.skins.enable", skinc);
					SenseUI.Label("目前本菜单不支持SK皮肤修改器", true);
					SenseUI.Label("启用选项后将调用AW的皮肤修改器", true);
				end
				SenseUI.EndGroup();
			end
			SenseUI.EndTab();
			if SenseUI.BeginTab( "players", SenseUI.Icons.playerlist ) then
				if SenseUI.BeginGroup( "Credits", "声明", 25, 120, 335, 245) then
					SenseUI.Label("此LUA脚本来自GitHub", true);
					SenseUI.Label("由柒修复 免费分享", true);
					SenseUI.Label("2878713023", true);
	
				end
				SenseUI.EndGroup();
				if SenseUI.BeginGroup( "Ps", "Player list", 25, 25, 235, 70 ) then
					local playerlist = gui.GetValue("misc.playerlist");
					playerlist = SenseUI.Checkbox("Enable", playerlist);
					gui.SetValue("misc.playerlist", playerlist);
					SenseUI.Label("目前本菜单不支持SK玩家列表", true);
					SenseUI.Label("启用选项后将调用AW的玩家列表", true);
				end
				SenseUI.EndGroup();
				
			end
			SenseUI.EndTab();
			if client.GetConVar("cl_mouseenable") ~= 0 then
				client.SetConVar("cl_mouseenable", 0, true)
			end
			local mouse_x, mouse_y = input.GetMousePos()
			draw.Color( 255, 255, 255, 255 )
			draw.SetFont(draw.CreateFont("Tahoma", 24));
			draw.Text(mouse_x-7, mouse_y-10, "")
			SenseUI.EndWindow();
		end
	
		if (load_pressed ~= old_load_pressed) and (#configs >= selected) then
			gui.Command("load " .. configs[selected], true)
		end
		
		if (save_pressed ~= old_save_pressed) and (#configs >= selected) then
			gui.Command("save " .. configs[selected], true)
		end
		
		if (add_pressed ~= old_add_pressed) and (configname ~= "") then
			table.insert(configs, configname)
			configname = ""
		end
		
		if (remove_pressed ~= old_remove_pressed) and (#configs >= selected) then
			configs[selected] = nil
		end
		
		old_load_pressed = load_pressed
		old_save_pressed = save_pressed
		old_add_pressed = add_pressed
		old_remove_pressed = remove_pressed
	
	end
	
	callbacks.Register( "Draw", "suitest", draw_callback );---   SenseUI Menu by uglych discord is Uglych#1515