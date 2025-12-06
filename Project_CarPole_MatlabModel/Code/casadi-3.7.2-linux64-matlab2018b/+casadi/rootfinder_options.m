function varargout = rootfinder_options(varargin)
    %ROOTFINDER_OPTIONS [INTERNAL] 
    %
    %  {char} = ROOTFINDER_OPTIONS(char name)
    %
    %Get all options for a plugin.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.hpp#L87
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.cpp#L87-L89
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(880, varargin{:});
end
