{ pkgs, ... }:
# Desktop shell
{
  programs.noctalia-shell = {
    enable = true;

    settings = {

      general = {
        avatarImage = "~/.face";
        dimmerOpacity = 0.5;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 0.5;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 0.85;
        animationDisabled = false;
        compactLockScreen = false;
        lockScreenAnimations = true;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = false;
        showHibernateOnLockScreen = false;
        enableLockScreenMediaControls = false;
        enableShadows = true;
        enableBlurBehind = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 0;
        shadowOffsetY = 8;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = false;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        clockStyle = "custom";
        clockFormat = "hh\\nmm";
        passwordChars = false;
        lockScreenMonitors = [ ];
        lockScreenBlur = 80;
        lockScreenTint = 0.4;
        reverseScroll = false;
        smoothScrollEnabled = true;
      };

      bar = {
        backgroundOpacity = 0;
        floating = true;
        position = "top";
        exclusive = true;
        hideOnOverview = true;
        density = "comfortable";
        monitors = [ ];
        showOutline = false;
        showCapsule = false;
        marginVertical = 0;
        marginHorizontal = 0.25;
        capsuleOpacity = 1;
        # capsuleColorKey = "surfaceVariant"; # more visible capsule bg
        widgetSpacing = 12;
        contentPadding = 8;
        fontScale = 1;
        enableExclusionZoneInset = true;
        useSeparateOpacity = true;
        frameThickness = 10;
        frameRadius = 16;
        outerCorners = true;
        displayMode = "always_visible";
        autoHideDelay = 500;
        autoShowDelay = 150;
        showOnWorkspaceSwitch = true;
        mouseWheelAction = "volume";
        reverseScroll = false;
        mouseWheelWrap = true;
        middleClickAction = "settings";
        middleClickFollowMouse = false;
        middleClickCommand = "";
        rightClickAction = "controlCenter";
        rightClickFollowMouse = true;
        rightClickCommand = "";
        screenOverrides = [ ];

        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Clock";
              customFont = "";
              formatHorizontal = "MMM dd, ddd,   hh:mm:ss A";
              formatVertical = "MMM dd ddd hh:mm:ss A";
              tooltipFormat = "dddd yyyy-MM-dd hh:mm:ss";
              useCustomFont = false;
            }
            {
              id = "Network";
              displayMode = "alwaysShow";
            }
            {
              id = "Bluetooth";
              displayMode = "onhover";
            }

            {
              id = "MediaMini";
              compactMode = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              maxWidth = 400;
              useFixedWidth = true;
              scrollingMode = "always";
              showAlbumArt = true;
              showArtistFirst = false;
              showProgressRing = true;
              showVisualizer = true;
              visualizerType = "wave";
              textColor = "primary";
            }

          ];

          center = [
            {
              id = "Workspace";
              characterCount = 10;
              colorizeIcons = false;
              enableScrollWheel = true;
              followFocusedScreen = true;
              groupedBorderOpacity = 1;
              hideUnoccupied = true;
              iconScale = 1;
              labelMode = "name";
              showApplications = false;
              pillSize = 0.7;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
          ];

          right = [

            {
              id = "Tray";
              blacklist = [ ];
              colorizeIcons = true;
              drawerEnabled = true;
              hidePassive = false;
              pinned = [ ];
            }

            {
              id = "SystemMonitor";
              compactMode = false;
              diskPath = "/";
              showCpuTemp = false;
              showCpuUsage = true;
              showDiskUsage = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = true;
              useMonospaceFont = true;
              usePrimaryColor = true; # use accent color
            }

            {
              id = "Volume";
              displayMode = "alwaysShow";
            }

            {
              id = "Microphone";
              iconColor = "none";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }

            {
              id = "NightLight";
              iconColor = "primary";

            }

            {
              id = "Brightness";
              displayMode = "alwaysShow";
            }

            {
              id = "Battery";
              displayMode = "icon-always";
              hideIfNotDetected = false;
              showNoctaliaPerformance = true;
              showPowerProfiles = true;
              warningThreshold = 40;
            }

            {
              id = "NotificationHistory";
              hideWhenZeroUnread = false;
              iconColor = "none";
              showUnreadBadge = true;
              unreadBadgeColor = "error";
            }

            {
              id = "SessionMenu";
              iconColor = "error";
            }
          ];
        };
      };

      ui = {
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = false;
        fontDefault = "JetBrainsMono Nerd Font";
        fontDefaultScale = 1;
        fontFixed = "JetBrainsMono Nerd Font Mono";
        fontFixedScale = 1;
        networkPanelView = "wifi";
        panelBackgroundOpacity = 0.4;
        panelsAttachedToBar = false;
        settingsPanelMode = "centered";
        tooltipsEnabled = true;
        wifiDetailsViewMode = "grid";
        settingsPanelSideBarCardStyle = true;
        scrollbarAlwaysVisible = false;
        translucentWidgets = true;
      };

      location = {
        name = "Kathmandu, Nepal";
        weatherEnabled = true;
        weatherShowEffects = true;
        weatherTaliaMascotAlways = false;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = 1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
        autoLocate = false;
      };

      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "timer-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };

      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "~/Pictures/Wallpapers";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "recursive";
        setWallpaperOnAllMonitors = true;
        linkLightAndDarkWallpapers = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "pixelate"
          "honeycomb"
        ];
        skipStartupTransition = false;
        transitionEdgeSmoothness = 0.05;
        panelPosition = "center";
        hideWallpaperFilenames = false;
        useOriginalImages = false;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        sortOrder = "name";
        favorites = [ ];
      };

      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = false;
        enableClipPreview = false;
        clipboardWrapText = true;
        enableClipboardSmartIcons = true;
        enableClipboardChips = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center";
        pinnedApps = [ ];
        sortByMostUsed = true;
        terminalCommand = "foot -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        enableSessionSearch = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
        overviewLayer = false;
        density = "comfortable";
      };

      controlCenter = {
        position = "top_left";
        diskPath = "/";
        shortcuts = {
          left = [
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            { id = "KeepAwake"; }
            { id = "PowerProfile"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "NightLight"; }
            { id = "WallpaperSelector"; }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          } # turn on
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        diskAvailWarningThreshold = 20;
        diskAvailCriticalThreshold = 10;
        batteryWarningThreshold = 20;
        batteryCriticalThreshold = 5;
        enableDgpuMonitoring = true;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
      };

      dock = {
        enabled = false;
        position = "bottom";
        displayMode = "auto_hide";
        dockType = "floating";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        showLauncherIcon = false;
        launcherPosition = "end";
        launcherUseDistroLogo = false;
        launcherIcon = "";
        launcherIconColor = "none";
        pinnedStatic = false;
        inactiveIndicators = false;
        groupApps = false;
        groupContextMenuMode = "extended";
        groupClickAction = "cycle";
        groupIndicatorStyle = "dots";
        deadOpacity = 0.6;
        animationSpeed = 1;
        sitOnFrame = false;
        showDockIndicator = false;
        indicatorThickness = 3;
        indicatorColor = "primary";
        indicatorOpacity = 0.6;
      };

      notifications = {
        enabled = true;
        enableMarkdown = false;
        density = "default";
        monitors = [ ];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 0.85;
        respectExpireTimeout = false;
        lowUrgencyDuration = 6;
        normalUrgencyDuration = 10;
        criticalUrgencyDuration = 30;
        clearDismissed = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = true;
        enableBatteryToast = true;
      };

      osd = {
        enabled = true;
        location = "top_right";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 0.85;
        enabledTypes = [
          0
          1
          2
          4
        ];
        monitors = [ ];
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 60;
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
        volumeFeedbackSoundFile = "";
        externalMixer = "pwvucontrol";
        visualizerType = "wave";
      };

      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
        backlightDeviceMappings = [ ];
      };

      colorSchemes = {
        useWallpaperColors = true;
        predefinedScheme = "Tokyo Night";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "08:00";
        manualSunset = "19:30";
        generationMethod = "tonal-spot";
        monitorForColors = "";
        syncGsettings = true;
      };

      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "cava";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "kcolorscheme";
          }
          {
            enabled = true;
            id = "niri";
          }
        ];
        enableUserTheming = false;
      };

      nightLight = {
        enabled = true;
        forced = false;
        autoSchedule = false;
        nightTemp = "4300";
        dayTemp = "3800";
        manualSunrise = "08:00";
        manualSunset = "19:30";
      };

      network = {
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 10000;
        networkPanelView = "wifi";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        disableDiscoverability = false;
        bluetoothAutoConnect = true;
      };

      sessionMenu = {
        enableCountdown = false;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        showKeybinds = true;
        largeButtonsStyle = false;
        largeButtonsLayout = "grid";
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = true;
          }
          {
            action = "hibernate";
            enabled = true;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
      };

      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
        colorGeneration = "";
      };

      plugins = {
        autoUpdate = false;
        notifyUpdates = true;
      };

      idle = {
        enabled = true;
        screenOffTimeout = 300; # 5 min → screen off 10% brightness
        lockTimeout = 960; # 16 min → lock
        suspendTimeout = 1140; # 19 min → suspend
        fadeDuration = 5;
        lockCommand = "hyprlock";
        suspendCommand = "systemctl suspend";
        screenOffCommand = "brightnessctl -s set 10%";
        resumeScreenOffCommand = "brightnessctl -r";
        resumeLockCommand = "";
        resumeSuspendCommand = "";
        customCommands = "[]";
      };

      desktopWidgets = {
        enabled = false;
        overviewEnabled = true;
        gridSnap = true;
        gridSnapScale = false;
        monitorWidgets = [
          {
            name = "eDP-1";
            widgets = [ ];
          }
        ];
      };
    };
  };
}
