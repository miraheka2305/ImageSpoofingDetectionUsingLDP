function varargout = GUInew(varargin)
% GUInew MATLAB code for GUInew.fig
%      GUInew, by itself, creates a new GUInew or raises the existing
%      singleton*.
%
%      H = GUInew returns the handle to a new GUInew or the handle to
%      the existing singleton*.
%
%      GUInew('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUInew.M with the given input arguments.
%
%      GUInew('Property','Value',...) creates a new GUInew or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUInew before GUInew_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUInew_OpeningFcn via varargin.
%
%      *See GUInew Options on GUIDE's Tools menu.  Choose "GUInew allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUInew

% Last Modified by GUIDE v2.5 05-Jan-2018 00:40:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUInew_OpeningFcn, ...
                   'gui_OutputFcn',  @GUInew_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUInew is made visible.
function GUInew_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUInew (see VARARGIN)

% Choose default command line output for GUInew
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUInew wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUInew_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browseButton.
function browseButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
[file, path]=uigetfile('*.bmp');
image=imread([path file]);
guidata(hObject, handles);
axes(handles.browseAxes);
imshow(image);


% --- Executes on button press in normalizedButton.
function normalizedButton_Callback(hObject, eventdata, handles)
% hObject    handle to normalizedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global imageNormalized;
imageNormalized = normalizedData(image);
guidata(hObject, handles);
axes(handles.normalizedAxes);
imshow(imageNormalized);




function LDPinput_Callback(hObject, eventdata, handles)
% hObject    handle to LDPinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LDPinput as text
%        str2double(get(hObject,'String')) returns contents of LDPinput as a double


% --- Executes during object creation, after setting all properties.
function LDPinput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LDPinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RadiusInput_Callback(hObject, eventdata, handles)
% hObject    handle to RadiusInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RadiusInput as text
%        str2double(get(hObject,'String')) returns contents of RadiusInput as a double


% --- Executes during object creation, after setting all properties.
function RadiusInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RadiusInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UniformInput_Callback(hObject, eventdata, handles)
% hObject    handle to UniformInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UniformInput as text
%        str2double(get(hObject,'String')) returns contents of UniformInput as a double


% --- Executes during object creation, after setting all properties.
function UniformInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UniformInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OverlappingInput_Callback(hObject, eventdata, handles)
% hObject    handle to OverlappingInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OverlappingInput as text
%        str2double(get(hObject,'String')) returns contents of OverlappingInput as a double


% --- Executes during object creation, after setting all properties.
function OverlappingInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OverlappingInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in extractButton.
function extractButton_Callback(hObject, eventdata, handles)
% hObject    handle to extractButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ResultInput_Callback(hObject, eventdata, handles)
% hObject    handle to ResultInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ResultInput as text
%        str2double(get(hObject,'String')) returns contents of ResultInput as a double


% --- Executes during object creation, after setting all properties.
function ResultInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ResultInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in predictionButton.
function predictionButton_Callback(hObject, eventdata, handles)
% hObject    handle to predictionButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function normalizeInput_Callback(hObject, eventdata, handles)
% hObject    handle to normalizeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of normalizeInput as text
%        str2double(get(hObject,'String')) returns contents of normalizeInput as a double


% --- Executes during object creation, after setting all properties.
function normalizeInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to normalizeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
