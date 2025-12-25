const std = @import("std");
const use_docking = @import("build_options").docking;
const ig = if (use_docking) @import("cimgui_docking") else @import("cimgui");
const sokol = @import("sokol");
const slog = sokol.log;
const sg = sokol.gfx;
const sapp = sokol.app;
const sglue = sokol.glue;
const simgui = sokol.imgui;

const state = struct {
    var pass_action: sg.PassAction = .{};
    var b: bool = true;
};

export fn init() void {
    // initialize sokol-gfx
    sg.setup(.{
        .environment = sglue.environment(),
        .logger = .{ .func = slog.func },
    });
    // initialize sokol-imgui
    simgui.setup(.{
        .logger = .{ .func = slog.func },
    });
    const io = ig.igGetIO();
    if (use_docking) io.*.ConfigFlags |= ig.ImGuiConfigFlags_DockingEnable;
    io.*.IniFilename = "src/imgui.ini";

    // initial clear color: dark gray
    state.pass_action.colors[0] = .{
        .load_action = .CLEAR,
        .clear_value = .{ .r = 0.15, .g = 0.15, .b = 0.15, .a = 1.0 },
    };
}

export fn frame() void {
    // call simgui.newFrame() before any ImGui calls
    simgui.newFrame(.{
        .width = sapp.width(),
        .height = sapp.height(),
        .delta_time = sapp.frameDuration(),
        .dpi_scale = sapp.dpiScale(),
    });

    // ui-code
    ig.igSetNextWindowSize(.{ .x = 400, .y = 200 }, ig.ImGuiCond_FirstUseEver);
    if (ig.igBegin("Hello This is my Website", &state.b, 0)) {
        ig.igText("Name: Felix Jaschul");
        ig.igText("Email: felix@jaschul.de");
        ig.igText("Github: https://github.com/felixjaschul/");
        ig.igText("Instagram: https://www.instagram.com/felixjaschul/");
        ig.igText("Location: Berlin, Germany");

    } ig.igEnd();

    // sokol-gfx pass
    sg.beginPass(.{
        .action = state.pass_action,
        .swapchain = sglue.swapchain()
    });

    simgui.render();
    sg.endPass();
    sg.commit();
}

export fn cleanup() void {
    simgui.shutdown();
    sg.shutdown();
}

export fn event(ev: [*c]const sapp.Event) void {
    // forward input events to sokol-imgui
    _ = simgui.handleEvent(ev.*);
}

pub fn main() void {
    sapp.run(.{
        .init_cb = init,
        .frame_cb = frame,
        .cleanup_cb = cleanup,
        .event_cb = event,
        .window_title = "Felix Jaschul",
        .width = 1400,
        .height = 800,
        .icon = .{ .sokol_default = true },
        .logger = .{ .func = slog.func },
    });
}
