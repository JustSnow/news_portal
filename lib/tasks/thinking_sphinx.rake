namespace :thinking_sphinx do
  task :run_in_foreground => [ 'ts:stop', 'ts:configure', 'ts:index' ] do
    controller = ThinkingSphinx::Configuration.instance.controller

    # Workaround to make Sphinx die nicely:
    #   - PTY.spawn invokes bash -c under the covers
    #   - Which turns SIGTERM into SIGHUP (not sure exactly why, can't seem to find a reason)
    #   - Which sphinx interprets as a reload instead of a quit
    #   - So, we need to remap HUP to KILL for the purposes of this script.

    unless pid = fork
      exec "#{controller.bin_path}#{controller.searchd_binary_name} --pidfile --config #{controller.path} --nodetach"
    end

    trap("SIGHUP") { Process.kill(:TERM, pid) }
    Process.wait
  end
end