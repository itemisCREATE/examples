"""GUI for the traffic light state machine example.

Using tkinter from the Python standard library.
"""
import tkinter as tk

class TrafficLightColour:
    """Provide colors for the traffic lights.

    This is devided in active and passive states of the lights. This represents
    the lights for RED, YELLOW, GREEN and REQUEST.
    """

    def __init__(self):
        # traffic light is active
        self.red_active = "red"
        self.yellow_active = "yellow"
        self.green_active = "#00FF00"
        self.req_active = "white"
        # traffic light is passive
        self.red_passive = "#6B0000"
        self.yellow_passive = "#6B6B00"
        self.green_passive = "#006B00"
        self.req_passive = "black"

class TrafficLightCar:
    """Traffic light for cars using RED, YELLOW and GREEN.
    """

    def __init__(self, canvas, x, y):
        self.canvas = canvas
        self.col = TrafficLightColour()
        # draw lights
        self.rect = self.canvas.create_rectangle(x,y,x+30,y+90,fill="gray")
        self.light_r = self.canvas.create_oval(x,y+ 0,x+30,y+30,fill=self.col.red_passive)
        self.light_y = self.canvas.create_oval(x,y+30,x+30,y+60,fill=self.col.yellow_passive)
        self.light_g = self.canvas.create_oval(x,y+60,x+30,y+90,fill=self.col.green_passive)

    def set_red(self, active):
        if active:
            self.canvas.itemconfig(self.light_r, fill=self.col.red_active)
        else:
            self.canvas.itemconfig(self.light_r, fill=self.col.red_passive)

    def set_yellow(self, active):
        if active:
            self.canvas.itemconfig(self.light_y, fill=self.col.yellow_active)
        else:
            self.canvas.itemconfig(self.light_y, fill=self.col.yellow_passive)

    def set_green(self, active):
        if active:
            self.canvas.itemconfig(self.light_g, fill=self.col.green_active)
        else:
            self.canvas.itemconfig(self.light_g, fill=self.col.green_passive)

class TrafficLightPedestrian:
    """Traffic light for pedestrians using RED, GREEN, REQUEST and a request
    button.
    """

    def __init__(self, frame, canvas, x, y):
        self.canvas = canvas
        self.col = TrafficLightColour()
        # draw lights
        self.rect = self.canvas.create_rectangle(x,y,x+30,y+90,fill="gray")
        self.light_req = self.canvas.create_oval(x,y,x+30,y+ 30,fill=self.col.req_passive)
        self.light_r = self.canvas.create_oval(x,y+30,x+30,y+ 60,fill=self.col.red_passive)
        self.light_g = self.canvas.create_oval(x,y+60,x+30,y+90,fill=self.col.green_passive)
        # include button into traffic light
        self.ped_button = tk.Button(frame,text="GO",command=self.btn_pressed_request,anchor="w")
        self.ped_button.configure(width=3,height=1,bg="yellow",activebackground="#33B5E5",relief="flat",borderwidth=2)
        self.btn_win = self.canvas.create_window(x,y+90,anchor="nw",window=self.ped_button)
        # request button pressed?
        self.is_btn_request_pressed = False

    def btn_pressed_request(self):
        self.is_btn_request_pressed = True

    def clear_events(self):
        self.is_btn_request_pressed = False

    def set_red(self, active):
        if active:
            self.canvas.itemconfig(self.light_r, fill=self.col.red_active)
        else:
            self.canvas.itemconfig(self.light_r, fill=self.col.red_passive)

    def set_green(self, active):
        if active:
            self.canvas.itemconfig(self.light_g, fill=self.col.green_active)
        else:
            self.canvas.itemconfig(self.light_g, fill=self.col.green_passive)

    def set_request(self, active):
        if active:
            self.canvas.itemconfig(self.light_req, fill=self.col.req_active)
        else:
            self.canvas.itemconfig(self.light_req, fill=self.col.req_passive)

class TrafficScene:
    """Whole traffic scene.

    Shows a crossing with one traffic light for cars and one for pedestrians.
    Use the 'On/Off' button to activate the traffic light system and 'Exit' to
    close the program.
    """

    def __init__(self, master):
        self.master = master
        self.create_frame_ctrl_buttons()
        self.create_frame_traffic()

    def create_frame_ctrl_buttons(self):
        ctrl_frame = tk.Frame(self.master)
        ctrl_frame.pack()
        onoff_btn = tk.Button(ctrl_frame, text="On/Off", command=self.btn_pressed_onoff)
        onoff_btn.pack()
        exit_btn = tk.Button(ctrl_frame, text="Exit", command=self.btn_pressed_exit)
        exit_btn.pack()
        self.is_btn_onoff_pressed = False
        self.is_btn_exit_pressed = False

    def btn_pressed_onoff(self):
        self.is_btn_onoff_pressed = True

    def btn_pressed_exit(self):
        self.is_btn_exit_pressed = True

    def create_frame_traffic(self):
        frame = tk.Frame(self.master)
        frame.pack()
        height = 360
        width = 360
        self.canvas = tk.Canvas(frame, width=width, height=height, bg="green")
        self.canvas.pack()
        self.canvas.create_rectangle(100,0,260,360,fill="black") # the street
        self.canvas.create_line(120,240,240,240,width= 10,fill="yellow") # car stop stripe
        for x in range(7): # pedestrain crossing stripes
            self.canvas.create_line(120+x*20,120,120+x*20,220,width=10,fill="white")
        self.tl_car = TrafficLightCar(self.canvas, 60, 240)
        self.tl_ped = TrafficLightPedestrian(frame, self.canvas, 240, 100)

    def btn_pressed_request(self):
        return self.tl_ped.is_btn_request_pressed

    def clear_events(self):
        self.tl_ped.clear_events()
        self.is_btn_exit_pressed = False
        self.is_btn_onoff_pressed = False
