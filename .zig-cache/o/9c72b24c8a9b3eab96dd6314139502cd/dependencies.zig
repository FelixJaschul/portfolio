pub const packages = struct {
    pub const @"N-V-__8AAEWFDwBdd7oE1EcCE3lK2y01-2ourXGKhpZeaZxQ" = struct {
        pub const build_root = "/Users/felixjaschul/.cache/zig/p/N-V-__8AAEWFDwBdd7oE1EcCE3lK2y01-2ourXGKhpZeaZxQ";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"cimgui-0.1.0-44ClkQ14kwAiwcr3ioDjxvPuiWQctWrt-tIFtsfP6xmU" = struct {
        pub const build_root = "/Users/felixjaschul/.cache/zig/p/cimgui-0.1.0-44ClkQ14kwAiwcr3ioDjxvPuiWQctWrt-tIFtsfP6xmU";
        pub const build_zig = @import("cimgui-0.1.0-44ClkQ14kwAiwcr3ioDjxvPuiWQctWrt-tIFtsfP6xmU");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"sokol-0.1.0-pb1HK1HTLQAsjVm5gHGpGI85Rwhwvu2KgCOTH-ZJ9sCS" = struct {
        pub const build_root = "/Users/felixjaschul/.cache/zig/p/sokol-0.1.0-pb1HK1HTLQAsjVm5gHGpGI85Rwhwvu2KgCOTH-ZJ9sCS";
        pub const build_zig = @import("sokol-0.1.0-pb1HK1HTLQAsjVm5gHGpGI85Rwhwvu2KgCOTH-ZJ9sCS");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "emsdk", "N-V-__8AAEWFDwBdd7oE1EcCE3lK2y01-2ourXGKhpZeaZxQ" },
            .{ "shdc", "sokolshdc-0.1.0-r2KZDtYXlQS2C2CNekXgsRqhyKk5JtGzBlFBTMX27o0f" },
        };
    };
    pub const @"sokolshdc-0.1.0-r2KZDtYXlQS2C2CNekXgsRqhyKk5JtGzBlFBTMX27o0f" = struct {
        pub const build_root = "/Users/felixjaschul/.cache/zig/p/sokolshdc-0.1.0-r2KZDtYXlQS2C2CNekXgsRqhyKk5JtGzBlFBTMX27o0f";
        pub const build_zig = @import("sokolshdc-0.1.0-r2KZDtYXlQS2C2CNekXgsRqhyKk5JtGzBlFBTMX27o0f");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "sokol", "sokol-0.1.0-pb1HK1HTLQAsjVm5gHGpGI85Rwhwvu2KgCOTH-ZJ9sCS" },
    .{ "cimgui", "cimgui-0.1.0-44ClkQ14kwAiwcr3ioDjxvPuiWQctWrt-tIFtsfP6xmU" },
};
