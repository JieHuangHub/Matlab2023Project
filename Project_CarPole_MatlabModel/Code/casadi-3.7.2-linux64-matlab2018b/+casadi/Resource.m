classdef  Resource < casadi.SharedObject & casadi.PrintableCommon
    %RESOURCE [INTERNAL] 
    %
    %
    %RAII class for reading from a zip file.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2cn
    %
    %C++ includes: resource.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = path(self,varargin)
    %PATH [INTERNAL] 
    %
    %  char = PATH(self)
    %
    %Get path for a consumer.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.hpp#L83
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.cpp#L70-L72
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1422, self, varargin{:});
    end
    function varargout = serialize(self,varargin)
    %SERIALIZE [INTERNAL] 
    %
    %  SERIALIZE(self, casadi::SerializingStream & s)
    %
    %Serialize an object.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2cq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.hpp#L88
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.cpp#L78-L80
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1423, self, varargin{:});
    end
    function varargout = change_option(self,varargin)
    %CHANGE_OPTION [INTERNAL] 
    %
    %  CHANGE_OPTION(self, char option_name, GenericType option_value)
    %
    %Change option after object creation for debugging.
    %
    %This is only possible for a selected number of options that do not 
    %change 
    %the numerical results of the comput
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2d4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.hpp#L96
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.cpp#L74-L76
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1424, self, varargin{:});
    end
    function self = Resource(varargin)
    %RESOURCE 
    %
    %  new_obj = RESOURCE()
    %  new_obj = RESOURCE(char path)
    %
    %
    %.......
    %
    %::
    %
    %  RESOURCE()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.hpp#L56
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.cpp#L32-L33
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  RESOURCE(char path)
    %
    %
    %
    %[INTERNAL] 
    %Initialize with a path.
    %
    %If the path is a directory or empty, the path is passed through to the
    % 
    %consumer. Otherwise, the zip file is extracted to a temporary 
    %directory.
    %
    %Upon destruction, the temporary directory is removed.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2co
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.hpp#L54
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/resource.cpp#L35-L42
    %
    %
    %
    %.............
    %
    %
      self@casadi.SharedObject(SwigRef.Null);
      self@casadi.PrintableCommon(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1426, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1427, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
    function varargout = type_name(varargin)
    %TYPE_NAME 
    %
    %  char = TYPE_NAME()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1420, varargin{:});
    end
    function varargout = test_cast(varargin)
    %TEST_CAST 
    %
    %  bool = TEST_CAST(casadi::SharedObjectInternal const * ptr)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1421, varargin{:});
    end
    function varargout = deserialize(varargin)
    %DESERIALIZE 
    %
    %  Resource = DESERIALIZE(casadi::DeserializingStream & s)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1425, varargin{:});
    end
  end
end
