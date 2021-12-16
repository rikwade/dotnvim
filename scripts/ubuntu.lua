local M = {}

function M:__popen(command)
    local handle = io.popen(command)
    local result = handle:read('*a')
    handle:close()

    return result
end

function M:__exec(command)
    return os.execute(command) == 0
end

function M:__exec_success_or_thorw(command)
    if M:_exec(command) then
        error(string.format('error while executing command "%s"', command))
    end
end

function M:__apt_install(package_list)
    local packages = table.concat(package_list, ' ')

    self:__exec('sudo apt install -y ' .. packages)
end

function M:__executable_exists(command)
    return self:__exec('command -v ' .. command)
end

function M:__file_exists(path)
    local f = io.open(path, 'r')

    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

function M:install_preconditions()
    -- install dependencies
    self:__apt_install({
        'git',
        'curl',
        'gcc',
        'python3-pip',
        'cmake',
        'ripgrep',
        'python-is-python3',
    })

    if not self:__executable_exists('nvim') then
        local target = '/usr/bin/nvim'
        local download_url =
            'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'

        self:__exec_success_or_thorw(
            string.format('sudo curl -o %s -L %s', target, download_url)
        )
    end

    if not self:__executable_exists('node') then
        local download_url = 'https://deb.nodesource.com/setup_lts.x'

        self:__exec_success_or_thorw(
            string.format('curl -fsSL %s | sudo -E bash', download_url)
        )
    end

    if not self:__executable_exists('yarn') then
        self:__exec_success_or_thorw('sudo npm install --global yarn')
    end

    self:__exec_success_or_thorw('yarn global add stylefmt')
end

function M:install_nvim_config()
    if self:__file_exists('~/.config/nvim') then
        self:__exec_success_or_thorw('mv ~/.config/nvim ~/.config/nvim-bak')
    end
end

return M
